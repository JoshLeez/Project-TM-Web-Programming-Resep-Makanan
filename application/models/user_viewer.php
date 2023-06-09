<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_viewer extends CI_Model
{
  function __construct()
  {
    parent::__construct();
    $this->load->library('session');
    $this->load->library('parser');
    $this->load->model('home_viewer');
  }

  public function show($view, $data = array())
  {
    // buat judul. kalau gak dikasih tau, tulis aja judulnya
    $datafinal['title'] = @$data['title'] ? $data['title'] : 'Josh Lee - Recipe';

    // load css tema 1 (t1) apa tema 2 (t2)? default t1 ya...
    $data['theme'] = $this->session->userdata('theme');
    if($data['theme'] === FALSE) $data['theme'] = 't1';
    $datafinal['css'] = $this->parser->parse('css', $data, TRUE);

    // sudah login? load menubar apa menubar_login?
    $hasLogin = $this->session->userdata('login_status');
    $datafinal['menubar'] = $this->parser->parse($hasLogin ? 'menubar_login' : 'menubar', $data, TRUE);

    // konten utama. misal home_view, user_timeline_view, dll.
    // tolong ini dibuat 1 file php aja yang isinya sidebar sama bagian tengahnya. oke?
    $datafinal['content'] = $this->parser->parse($view, $data, TRUE);

    // js di-load di akhir aja gpp. (katanya "best practice" di bootstrap)
    $datafinal['js'] = $this->parser->parse('js', $data, TRUE);

    // oke, sudah semua? LOAD!
    $this->parser->parse('final_view', $datafinal);
  }

  public function showProfile($profile)
  {
    $profile = (object)array_map("htmlspecialchars", (array)$profile);
    // menubar
    $datacomplete['menubar'] = $this->home_viewer->getMenubar();
    // DONE

    // content_website
    // template_content diambil dari template_user_view: butuh sidebar_user dan content_user
    // ambil sidebar
    $data_user_view['sidebar_user'] = $this->getSidebar($profile);
    // ambil content_user dari profile_view
    $data_user_view['content_user'] = $this->parser->parse(
        'profile_view',
        array(
            'profile_user_id' => $profile->id,
            'profile_user_name' => $profile->name,
            'profile_user_gender' => $profile->gender == 'M' ? 'male' : 'female',
            'profile_user_bdate' => $profile->bdate,
            'profile_user_age' => $profile->bdate == '1970-01-01' ? '' : (new DateTime())->diff(new DateTime($profile->bdate))->y . " years old",
            'profile_user_email' => $profile->email,
            'profile_user_phone' => $profile->phone,
            'profile_user_last_access' => $profile->last_access,
            'profile_user_twitter' => $profile->twitter,
            'profile_user_facebook' => $profile->facebook,
            'profile_user_googleplus' => $profile->googleplus,
            'profile_user_path' => $profile->path,
        ),
        TRUE
    );
    // load template_content
    $datacomplete['content_website'] = $this->parser->parse('template_user_view', $data_user_view, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  public function showUserTimeline($profile, $listRecipes, $pagenow, $totalpage)
  {
    $profile = (object)array_map("htmlspecialchars", (array)$profile);
    // menubar
    $datacomplete['menubar'] = $this->home_viewer->getMenubar();
    // DONE

    // content_website
    // template_content diambil dari template_user_view: butuh sidebar_user dan content_user
    // ambil sidebar
    $data_user_view['sidebar_user'] = $this->getSidebar($profile);
    // ambil content_user dari user_timeline_view
    foreach ($listRecipes as $row) {
        $row->user_timeline_recipe_id = $row->id;
        $row->user_timeline_recipe_photo = $row->photo;
        $row->user_timeline_recipe_name = $row->name;
        $row->user_timeline_recipe_rating = $row->rating;
        $row->user_timeline_recipe_last_update = $row->last_update;
        $row->user_timeline_recipe_view = $row->views;
        $row->checked_status = $row->status ? "checked" : "";
    }

    $data_user_view['content_user'] = $this->parser->parse(
        'user_timeline_view',
        array(
            'user_timeline_recipe_entries' => $listRecipes,
            'user_timeline_name' => $profile->name,
            'user_timeline_id' => $profile->id,
            'user_timeline_recipe_page_size' => $totalpage,
            'user_timeline_recipe_page_now' => $pagenow,
        ),
        TRUE
    );

    // load template_content
    $datacomplete['content_website'] = $this->parser->parse('template_user_view', $data_user_view, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  public function showFavorite($profile, $listRecipes, $pagenow, $totalpage)
  {
    $profile = (object)array_map("htmlspecialchars", (array)$profile);
    // menubar
    $datacomplete['menubar'] = $this->home_viewer->getMenubar();
    // DONE

    // content_website
    // template_content diambil dari template_user_view: butuh sidebar_user dan content_user
    // ambil sidebar
    $data_user_view['sidebar_user'] = $this->getSidebar($profile);
    // ambil content_user dari user_timeline_view
    foreach ($listRecipes as $row) {
        $row->favorite_recipe_id = $row->id;
        $row->favorite_recipe_photo = $row->photo;
        $row->favorite_recipe_name = $row->name;
        $row->favorite_recipe_rating = $row->rating;
        $row->favorite_recipe_last_update = $row->last_update;
        $row->favorite_recipe_view = $row->views;
        $row->checked_status = $row->status ? "checked" : "";
    }

    $data_user_view['content_user'] = $this->parser->parse(
        'favorite_view',
        array(
            'favorite_recipe_entries' => $listRecipes,
            'favorite_user_name' => $profile->name,
            'favorite_user_id' => $profile->id,
            'favorite_recipe_page_size' => $totalpage,
            'favorite_recipe_page_now' => $pagenow,
        ),
        TRUE
    );

    // load template_content
    $datacomplete['content_website'] = $this->parser->parse('template_user_view', $data_user_view, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  public function showCookLater($profile, $listRecipes, $listRecipeFinished, $pagenow, $pagenowFinished, $totalpage, $totalpageFinished)
  {
    $profile = (object)array_map("htmlspecialchars", (array)$profile);
    // menubar
    $datacomplete['menubar'] = $this->home_viewer->getMenubar();
    // DONE

    // content_website
    // template_content diambil dari template_user_view: butuh sidebar_user dan content_user
    // ambil sidebar
    $data_user_view['sidebar_user'] = $this->getSidebar($profile);
    // ambil content_user dari user_timeline_view
    // print_r($listRecipes);
    // die();
    $listRecipesFinished=array();
    $listRecipesUnfinished=array();
    foreach ($listRecipes as $row) {
        $row->cook_later_recipe_id = $row->id;
        $row->cook_later_recipe_photo = $row->photo;
        $row->cook_later_recipe_name = $row->name;
        $row->cook_later_recipe_rating = $row->rating;
        $row->cook_later_recipe_last_update = $row->last_update;
        $row->cook_later_recipe_view = $row->views;
        array_push($listRecipesUnfinished, $row);
    }
    foreach ($listRecipeFinished as $row) {
        $row->cook_later_recipe_id = $row->id;
        $row->cook_later_recipe_photo = $row->photo;
        $row->cook_later_recipe_name = $row->name;
        $row->cook_later_recipe_rating = $row->rating;
        $row->cook_later_recipe_last_update = $row->last_update;
        $row->cook_later_recipe_view = $row->views;
        array_push($listRecipesFinished, $row);
    }
    // print_r($listRecipes);
    // die();
    $data = array(
            'cook_later_recipe_entries_unfinished' => $listRecipesUnfinished,
            'cook_later_recipe_entries_finished' => $listRecipesFinished,
            'cook_later_user_name' => $profile->name,
            'cook_later_user_id' => $profile->id,
            'cook_later_recipe_page_size' => $totalpage,
            'cook_later_recipe_page_size_finished' => $totalpageFinished,
            'cook_later_recipe_page_now' => $pagenow,
            'cook_later_recipe_page_now_finished' => $pagenowFinished,
        );
    $data_user_view['content_user'] = $this->parser->parse('cook_later_view', $data, TRUE );

    // load template_content
    $datacomplete['content_website'] = $this->parser->parse('template_user_view', $data_user_view, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  public function showChangePassword($profile, $data = array())
  {
    $profile = (object)array_map("htmlspecialchars", (array)$profile);
    // menubar
    $datacomplete['menubar'] = $this->home_viewer->getMenubar();
    // DONE

    // content_website
    // template_content diambil dari template_user_view: butuh sidebar_user dan content_user
    // ambil sidebar
    $data_user_view['sidebar_user'] = $this->getSidebar($profile);
    // ambil content_user dari user_timeline_view
    $data_user_view['content_user'] = $this->parser->parse(
        'change_password_view',
        $data,
        TRUE
    );

    // load template_content
    $datacomplete['content_website'] = $this->parser->parse('template_user_view', $data_user_view, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  public function showRegister($data = array())
  {
    // menubar
    $datacomplete['menubar'] = $this->parser->parse('menubar', array(), TRUE);
    // DONE

    // content_website
    // ambil dari registration_view
    $datacomplete['content_website'] = $this->parser->parse('join_view', $data, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  public function showEditProfile($profile)
  {
    // menubar
    $datacomplete['menubar'] = $this->home_viewer->getMenubar();
    // DONE

    // content_website
    // template_content diambil dari template_user_view: butuh sidebar_user dan content_user
    // ambil sidebar
    $data_user_view['sidebar_user'] = $this->getSidebar($profile);
    // ambil content_user dari profile_view
    $arr = array_map("htmlspecialchars", array(
            'edit_profile_id' => $profile->id,
            'edit_profile_name' => $profile->name,
            'edit_profile_photo' => $profile->photo,
            'edit_profile_title' => $profile->name."'s photo",
            'edit_profile_male' => $profile->gender == 'M' ? 'checked' : '',
            'edit_profile_female' => $profile->gender == 'F' ? 'checked' : '',
            'edit_profile_birth_date' => (new DateTime($profile->bdate))->format('Y-m-d'),
            'edit_profile_email' => $profile->email,
            'edit_profile_phone' => $profile->phone,
            'edit_profile_last_access' => $profile->last_access,
            'edit_profile_twitter' => $profile->twitter,
            'edit_profile_facebook' => $profile->facebook,
            'edit_profile_google_plus' => $profile->googleplus,
            'edit_profile_path' => $profile->path,
        ));
    $arr['edit_profile_alert'] = $profile->edit_profile_alert;
    $data_user_view['content_user'] = $this->parser->parse('edit_profile_view', $arr, TRUE);
    // load template_content
    $datacomplete['content_website'] = $this->parser->parse('template_user_view', $data_user_view, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  function showForgotPassword($data)
  {
    // menubar
    $datacomplete['menubar'] = $this->parser->parse('menubar', array(), TRUE);
    // DONE

    // content_website
    // ambil dari registration_view
    $datacomplete['content_website'] = $this->parser->parse('forget_password_view', $data, TRUE);

    // butuh menubar dan content_website
    $this->parser->parse('template_content', $datacomplete);
  }

  function getSidebar($profile)
  {
    $u = new User_model();
    $id = $this->session->userdata('user_id');
    if($id!=''){
        $status = $u->getProfile($id)->status;
    }
    else{
        $status = "member";    
    }
    
    return $this->parser->parse(
        'sidebar_user_view',
        array(
            'sidebar_user_id' => $profile->id,
            'sidebar_user_photo' => $profile->photo,
            'sidebar_user_status_profile' => $profile->status,
            'sidebar_user_status_admin' => $status,
            'sidebar_showadmin' => $id == $profile->id && strtolower($profile->status) == 'admin',
        ),
        TRUE
    );
  }

}