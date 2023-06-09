<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->library('upload');
		$this->load->library('session');
		$this->load->helper('file');
		$this->load->model('user_model');
		$this->load->model('user_viewer');
	}

	public function index(){
		$this->timeline();
	}

	/*
		digunakan untuk menampilkan halaman profile user 
	*/
	public function profile($id = -1){
		if ($id == -1) {
			$id = $this->user_model->wajiblogin();
		}
		$profile = $this->user_model->getProfile($id);
		$this->user_viewer->showProfile($profile);
	}

	/*
		digunakan untuk menampilkan halaman timeline user 
	*/
	public function timeline($id = -1){
		if ($id == -1) {
			$id = $this->user_model->wajiblogin();
		}
		$profile = $this->user_model->getProfile($id);
		$r = new Recipe_model();
		$page = $this->input->get('page');
		if($page === FALSE) $page = 1;
		$limit = 5;
		$flag = $id == $this->session->userdata('user_id') ? 'all' : '';
		$listRecipe = $r->getUserRecipe($id, $flag, $limit, $limit * $page - $limit);
		/*if ($id != $this->session->userdata('user_id')) {
			$listRecipe = array_filter($listRecipe, function($row){return $row->status == 1;});
		}*/
		$totalpage = ceil(sizeof( $r->getUserRecipe($id, $flag, 1000111) )/$limit);
		$this->user_viewer->showUserTimeline($profile, $listRecipe, $page, $totalpage);
	}

	/*
		digunakan untuk menampilkan halaman favorite user 
	*/
	public function favorite($id = -1){
		if ($id == -1) {
			$id = $this->user_model->wajiblogin();
		}
		$profile = $this->user_model->getProfile($id);
		$page = $this->input->get('page');
		if($page === FALSE) $page = 1;
		$limit = 5;
		$rcp = new Recipe_model();
		$r = new Favorite();
		$listrecipeid = $r->getFavoriteRecipeByUser($id, $limit, $limit * $page - $limit);
		if($page > 1 && empty($listrecipeid)){
			redirect(base_url('index.php/user/favorite'));
		}
		$listRecipe = array();
		foreach ($listrecipeid as $obj) {
			$x = $rcp->getRecipeProfile($obj, $id);
			if($x){
				array_push($listRecipe,$x);
			}
		}
		$totalpage = ceil(sizeof( $r->getFavoriteRecipeByUser($id, 1000111) )/$limit);
		$this->user_viewer->showFavorite($profile, $listRecipe, $page, $totalpage);
	}

	/*
		digunakan untuk menampilkan halaman cook later user 
	*/
	public function cooklater(){
		$id = $this->user_model->wajiblogin();
		$profile = $this->user_model->getProfile($id);
		$page = $this->input->get('page');
		$tab = $this->input->get('tab');
		$pageFinished = $this->input->get('page-finished');
		if($page === FALSE) $page = 1;
		if($pageFinished === FALSE) $pageFinished = 1;
		$limit = 5;
		$r = new Recipe_model();
		$c = new Cooklater();
		$listrecipeid = $c->getCookLaterRecipeByUser($id, $limit, $limit * $page - $limit);
		if(strtolower($tab)=="unfinish" && $page > 1 && empty($listrecipeid)){
			redirect(base_url('index.php/user/cooklater?tab=unfinish'));
		}
		$listrecipeidFinished = $c->getCookLaterFinishedRecipeByUser($id, $limit, $limit * $pageFinished - $limit);
		if(strtolower($tab)=="finish" && $pageFinished > 1 && empty($listrecipeidFinished)){
			redirect(base_url('index.php/user/cooklater?tab=finish'));
		}
		$listRecipe = array();
		foreach ($listrecipeid as $obj) {
			$x = $r->getRecipeProfile($obj['id'], $id);
			if($x){
				$x->status = $obj['flag'];
				array_push($listRecipe,$x);
			}
		}

		$listRecipeFinished = array();
		foreach ($listrecipeidFinished as $obj) {
			$x = $r->getRecipeProfile($obj['id'], $id);
			if($x){
				$x->status = $obj['flag'];
				array_push($listRecipeFinished,$x);
			}
		}
		$totalpage = ceil(sizeof( $c->getCookLaterRecipeByUser($id, 1000111) )/$limit);
		$totalpageFinished = ceil(sizeof( $c->getCookLaterFinishedRecipeByUser($id, 1000111) )/$limit);
		$this->user_viewer->showCookLater($profile, $listRecipe, $listRecipeFinished, $page, $pageFinished, $totalpage, $totalpageFinished);
	}

	/*
		digunakan untuk menampilkan halaman change password user 
	*/
	public function changepassword(){
		$data['id'] = $this->user_model->wajiblogin();
		$data['change_password_alert'] = '';
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			$data['oldPass'] = $this->input->post("old_password");
			$data['newPass'] = $this->input->post("new_password");
			$data['confirmPass'] = $this->input->post("confirm_new_password");

			$cp = $this->_is_valid_changepassword($data);
			if($cp === TRUE){
				$success = $this->user_model->updatePassword($data['id'], $data['newPass']);
				$data['change_password_alert'] = $success ? "<div class=\"alert alert-success\">password has been changed successfully</div>" : "<div class=\"alert alert-danger\">change password failed</div>";
			}
			else{
				$data['change_password_alert'] = "<div class=\"alert alert-danger\">$cp</div>";
			}
		}

		$profile = $this->user_model->getProfile($data['id']);

		$this->user_viewer->showChangePassword($profile, $data);
	}

	/*
		digunakan untuk validasi change password 
	*/
	private function _is_valid_changepassword($data)
	{
		$u = new User_model();
		if($u->where('id', $data['id'])->count() > 0)
		{
			$u->where('id', $data['id'])->get();
			$email = $u->email;
			if(is_array($u->login($email, $data['oldPass'])))
			{
				if ($data['newPass'] == $data['confirmPass']) {
					if (strlen($data['newPass']) >= 5) return TRUE;
					return "new password is too short. minimum 5 characters.";
				}
				return "new password and confirm new password doesn't match";
			}
			return "old password doesn't match";
		}
		return "user doesn't exists";
	}

	/*
		digunakan untuk menampilkan halaman register user 
	*/
	public function join()
{
    $data['join_alert'] = '';
    $data['name'] = '';
    $data['email'] = '';
    $data['gender'] = '';
    $data['checked_male'] = '';
    $data['checked_female'] = '';

    if ($this->input->server('REQUEST_METHOD') == 'POST') {
        $data['name'] = $this->input->post("name");
        $data['email'] = $this->input->post("email");
        $data['gender'] = $this->input->post("genderOptions");
        $data['photo'] = $data['gender'] == 'M' ? 'assets/img/user-male.png' : 'assets/img/user-female.png';
        $data['password'] = $this->input->post("password");
        $data['confirm_password'] = $this->input->post("confirm_password");

        if ($this->_validate_join($data) === TRUE) {
            if ($this->user_model->createUser($data)) {
                $profile_menubar = $this->user_model->login($data['email'], $data['password']);
                foreach ($profile_menubar as $key => $value) {
                    $this->session->set_userdata($key, $value);
                }
                $alert = "<div id='alert-notification' data-status='success' data-message='Welcome to Josh Lee - Recipe' class='hidden'></div>";
                $this->session->set_flashdata('alert-notification', $alert);
                redirect(base_url() . 'index.php/user');
                die;
            } else {
                $data['join_alert'] = '<div class="alert alert-warning">Join Failed!</div>';
            }
        } else {
            $data['join_alert'] = '<div class="alert alert-danger">' . $this->_validate_join($data) . '</div>';
        }
    }
    $data['checked_male'] = $data['gender'] == 'M' ? 'checked="checked"' : '';
    $data['checked_female'] = $data['gender'] == 'F' ? 'checked="checked"' : '';
    $this->user_viewer->showRegister($data);
}


	/*
		digunakan untuk menampilkan halaman edit profile user 
	*/
	public function edit(){
		$data['id'] = $this->user_model->wajiblogin();

		$data['edit_profile_alert'] = '';
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if (file_exists('images/tmp/user/'.$data['id'].'.jpg')) {
				rename('images/tmp/user/'.$data['id'].'.jpg', 'images/user/'.$data['id'].'.jpg');
				$data['photo'] = 'images/user/'.$data['id'].'.jpg';
			}
			$data['name'] = $this->input->post('user_name');
			$data['phone'] = $this->input->post('user_phone');
			$data['bdate'] = $this->input->post('user_bdate');
			$data['twitter'] = $this->input->post('user_twitter');
			$data['facebook'] = $this->input->post('user_facebook');
			$data['googleplus'] = $this->input->post('user_gplus');
			$data['path'] = $this->input->post('user_path');
			$message = $this->_validate_edit_profile($data);
			if ($message === TRUE) { // jika data editan benar
				unset($data['edit_profile_alert']);
				if($this->user_model->updateProfile($data['id'], $data)) {
					$data['edit_profile_alert'] = "<div class=\"alert alert-success\">profile has been updated successfully</div>";
					$this->session->set_userdata('user_name', $data['name']);
					if(file_exists('images/user/'.$data['id'].'.jpg')) {
						$this->session->set_userdata('user_photo', 'images/user/'.$data['id'].'.jpg');
					}
					$alert = "<div id='alert-notification' data-status='success' data-message='Success edit profile' class='hidden'></div>";
					$this->session->set_flashdata('alert-notification', $alert);
					 redirect(base_url()."index.php/user/edit/".$data['id']);
				}
				else
					$data['edit_profile_alert'] = "<div class=\"alert alert-warning\">update profile failed</div>";
			} else $data['edit_profile_alert'] = "<div class=\"alert alert-danger\">$message</div>";
		}
		$profile = $this->user_model->getProfile($data['id']);
		foreach ($data as $key => $value) $profile->$key = $value;
		$this->user_viewer->showEditProfile($profile);
	}

	/*
		digunakan untuk validasi edit profile user 
	*/
	private function _validate_edit_profile($profile)
	{
		// trim all
		$profile = array_map("trim", $profile);
		// cek bdate
		if ( !preg_match("/^[a-zA-Z '-]{1,51}$/", $profile['name']) ) return 'invalid name';
		if( (new DateTime($profile['bdate'])) > (new DateTime) ) return 'invalid birth date';
		# 083...10-12 length
		if( strlen($profile['phone']) > 0 && !preg_match('/^08\\d{8,10}$/', $profile['phone']) ) return 'invalid phone number';
		return TRUE;
	}

	/*
		digunakan untuk menampilkan halaman forgot password user 
	*/
	public function forgotPassword(){ 
		$data['forget_password_alert'] = '';
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			$email = $this->input->post('email_user');
			$data['email'] = $email;
			$password = $this->user_model->getPasswordByEmail($email);
			if($password !== FALSE) {
				$sendreport = $this->_sendPassword($email, $this->user_model->getNameByEmail($email), $password);
				if ($sendreport == TRUE) {
					$data['forget_password_alert'] = "<div class=\"alert alert-success\">your password has been sent to ".htmlspecialchars($email).".</div>";
				}else $data['forget_password_alert'] = '<div class="alert alert-warning">sending email failed</div>';
			} else $data['forget_password_alert'] = "<div class=\"alert alert-danger\">".htmlspecialchars($email)." not registered</div>";
		}
		$this->user_viewer->showForgotPassword($data);
	}

	/*
		digunakan untuk validasi register user baru 
	*/
	private function _validate_join($profile){
		// email sudah kedaftar belum?
		$u = new User_model();
		if($u->where('email', $profile['email'])->count() > 0) return $profile['email']." has been registered";
		if(!filter_var($profile['email'], FILTER_VALIDATE_EMAIL)) return "invalid email";
		if($profile['password'] !== $profile['confirm_password']) return "password doesn't match";
		if(strlen($profile['password']) < 5) return "minimum password length is 5";
		return TRUE;
	}



	private function _sendPassword($email, $name, $password) {
		return $this->_send_smtp_email([
			"sender" => "test@gmail.com",
			"sender_name" => "test Administrator",
			"receiver" => $email,
			"receiver_name" => $name,
			"subject" => "Your test Password",
			"message" => "You said that you have forgotten your password.\nHere you are! Your password is $password.",
			]);
	}

	function _send_smtp_email($data)
	{
		// $data: sender, sender_name, receiver, receiver_name, subject, message
		extract($data);
		$alluser = [$receiver => $receiver_name];
		return "Message sent!" == file_get_contents("http://alfan.coderhutan.com/mailer/sendgmail.php?".http_build_query([
			"to" => $alluser,
			"subject" => $subject,
			"message" => $message,
			]));
		require_once('application/libraries/mailer/PHPMailerAutoload.php');
		$mail = new PHPMailer();
		$mail->IsSMTP();                       // telling the class to use SMTP
		$mail->SMTPDebug = 0;                  // 0 = no output, 1 = errors and messages, 2 = messages only.
		$mail->SMTPAuth = true;                // enable SMTP authentication 
		$mail->SMTPSecure = "tls";             // sets the prefix to the servier
		$mail->Host = "smtp.gmail.com";        // sets Gmail as the SMTP server
		$mail->Port = 587;                     // set the SMTP port for the GMAIL 

		$mail->Username = "test";         // Gmail username
		$mail->Password = "test";      // Gmail password

		// $mail->CharSet = 'windows-1250';
		$mail->SetFrom ($sender, @$sender_name);
		$mail->Subject = @$subject;
		$mail->ContentType = 'text/html';
		$mail->IsHTML(TRUE);
		$mail->Body = @$message; 
		// you may also use $mail->Body = file_get_contents('your_mail_template.html');
		$mail->AddAddress ($receiver, @$receiver_name);
		// you may also use this format $mail->AddAddress ($recipient);
		return $mail->Send();
	}

	/*
		digunakan untuk mengubah user online
	*/
	public function setOnline()
	{
		$id = $this->session->userdata('user_id');
		if($id <= 0) die('not logged in');
		$u = new User_model();
		date_default_timezone_set("Asia/Jakarta");
		if($u->where('id', $id)->update('last_access', date("Y-m-d H:i:s")))
			echo "$id is set to be online!";
		else
			echo "failed to set $id to be online -_-";
	}

	/*
		digunakan untuk melihat user sedang online
	*/
	public function getOnline()
	{
		$user_id = $this->session->userdata('user_id');
    $u = new User_model();
    date_default_timezone_set("Asia/Jakarta");
    $one_minute_ago = (new DateTime())->modify("-20 second")->format("Y-m-d H:i:s");
    $res = $u->where('last_access >', $one_minute_ago)->get();
    $online_users = [];
    foreach ($res as $obj)
      if($obj->id != $user_id)
        $online_users[] = (object)["id" => $obj->id, "name" => $obj->name, "photo" => $obj->photo];
    echo json_encode($online_users);
	}

	/*
		digunakan untuk menampilkan halaman message sebuah conversation 
	*/
	public function message($conversation_id=-1)
	{
		$id = $this->user_model->wajiblogin();
		if($id)
		{
			$u = new User_model();
			$this->load->model('home_viewer');
			$listConversation = $u->getAllConversationUser($id);
			if(sizeof($listConversation)>0){
				$conversations = new Conversation();
				$dataConversation = array();
				foreach ($listConversation as $conversation_item) {
					if($conversation_id<0){
						redirect(base_url()."index.php/user/message/$conversation_item->id");
					}
				}
				$listMessages = $conversations->getAllMessages($conversation_id, $id, true);
				if(sizeof($listMessages)==0){
					$this->pageNotFound();
				}
				$u = new User_model();
				$datamessage = array();
				for ($i=(sizeof($listMessages)-1); $i >=0 ; $i--) { 
					$dataTmp=array(
						"conversation_message_user_photo"=> $u->getProfile($listMessages[$i]->sender_id)->photo,
						"conversation_message_user_id" =>$listMessages[$i]->sender_id,
						"conversation_message_user_name" => $u->getProfile($listMessages[$i]->sender_id)->name,
						"conversation_message_submit" => $listMessages[$i]->submit,
						"conversation_message_description" => nl2br($listMessages[$i]->description),
						);
					array_push($datamessage, $dataTmp);
				}
				$con = new Conversation();
				$listMember = $con->getMembers($conversation_id, $id);
				$dataMember = array();
				foreach ($listMember as $obj) {
					$dataTmp = array(
						"conversation_member_name" => $u->getProfile($obj)->name,
						"conversation_member_photo" => $u->getProfile($obj)->photo,
						"conversation_member_id" => $u->getProfile($obj)->id,
						);
					array_push($dataMember, $dataTmp);
				}
				$subject = $con->subject;
				if(empty($subject)){
					$subject .="You";
					$i = 0;
					while($i<2 && $i<(sizeof($listMember))) {
						$subject .=", "."<a href='".base_url()."index.php/user/timeline/".$listMember[$i]."'>".$u->getProfile($listMember[$i])->name."</a>";
						$i++;
					}
					if(sizeof($listMember)>2){
						$subject .= " and ";
					}
				}
				$data = array(
					"conversation_member_entries" => $dataMember,
					"conversation_subject" => $subject,
					"conversation_message_entries"=>$datamessage,
					"conversation_id" => $conversation_id,
					);
				$content_conversation = $this->parser->parse("conversation_view", $data, true);
				$dataConversation = array();
				foreach ($listConversation as $conversation_item) {
					$subject_sidebar_conversation = $conversation_item->subject;
					$sender_photo = $u->getProfile($conversation_item->sender_id)->photo;
					if(empty($subject_sidebar_conversation)){
						$members = $conversations->getMembers($conversation_item->id, $id);
						if(sizeof($members)==1){
							$subject_sidebar_conversation = $u->getProfile($members[0])->name;
							$sender_photo = $u->getProfile($members[0])->photo;
						}
						else{
							$x = 0;
							foreach ($members as $member) {
								if($x==(sizeof($members)-1)){
									$subject_sidebar_conversation .= $u->getProfile($member)->name;
								}
								else if($x<2){
									$subject_sidebar_conversation .= $u->getProfile($member)->name.", ";	
								}
								$x++;
							}
							if(sizeof($members)>2){
								$subject_sidebar_conversation .= " and ".(sizeof($members)-2)." others";
							}
						}
					}
					$tmp = array(
						"sidebar_conversation_id" => $conversation_item->id,
						"sidebar_conversation_unread" => $conversations->getCountUnreadMessage($conversation_item->id, $id),
						"sidebar_conversation_sender_photo" => $sender_photo,
						"sidebar_conversation_subject" => $subject_sidebar_conversation,
						"sidebar_conversation_submit" => $conversation_item->time_last_message,
						"sidebar_conversation_participants" => "( ".(sizeof($conversations->getMembers($conversation_item->id, $id))+1)." Participants)",
						"sidebar_conversation_last_message" => $conversation_item->last_message,
					);
					array_push($dataConversation, $tmp);
				}
				$conversation = new Conversation();
		        $u = new User_model();
		        $listConversation = $u->getAllConversationUser($this->session->userdata('user_id'));
		        $countUnreadMessage = 0;
		        foreach ($listConversation as $conversations) {
		          $countUnreadMessage += $conversation->getCountUnreadMessage($conversations->id, $this->session->userdata('user_id'));
		        }
				$data = array(
					"sidebar_conversation_entries" => $dataConversation,
					"sidebar_conversation_total" => $countUnreadMessage,
					);
				$content_sidebar_conversation = $this->parser->parse("sidebar_conversation", $data, true);
				$data = array(
						"content_conversation" => $content_conversation,
						"content_sidebar_conversation" => $content_sidebar_conversation
					);
				$content_website = $this->parser->parse('template_conversation', $data, TRUE);
				$menubar = $this->home_viewer->getMenubar();
				$data = array(
							"menubar" => $menubar,
							"content_website" => $content_website,
						);
				$this->parser->parse('template_content', $data);
			}
			else{
				$data = array(
					"conversation_member_entries" => array(),
					"conversation_subject" => "",
					"conversation_message_entries"=> array(),
					);
				$content_conversation = $this->parser->parse("conversation_view", $data, true);
				$data = array("sidebar_conversation_entries" => array(),
								"sidebar_conversation_total" => 0);
				$content_sidebar_conversation = $this->parser->parse("sidebar_conversation", $data, true);
				$data = array(
						"content_conversation" => $content_conversation,
						"content_sidebar_conversation" => $content_sidebar_conversation
					);
				$content_website = $this->parser->parse('template_conversation', $data, TRUE);
				$menubar = $this->home_viewer->getMenubar();
				$data = array(
							"menubar" => $menubar,
							"content_website" => $content_website,
						);
				$this->parser->parse('template_content', $data);
			}
			
		}else redirect(base_url('index.php/home/login'));
	}
	
	/*
		digunakan untuk menampilkan halaman membuat conversation
	*/
	public function createConversation()
	{
		$id = $this->user_model->wajiblogin();
		if($id)
		{
			$u = new User_model();
			$conversations = new Conversation();
			$content_conversation = $this->parser->parse("new_conversation_view", array(), true);
			$listConversation = $u->getAllConversationUser($id);
			$dataConversation = array();
			foreach ($listConversation as $conversation_item) {
				$subject_sidebar_conversation = $conversation_item->subject;
				$sender_photo = $u->getProfile($conversation_item->sender_id)->photo;
				if(empty($subject_sidebar_conversation)){
					$members = $conversations->getMembers($conversation_item->id, $id);
					if(sizeof($members)==1){
						$subject_sidebar_conversation = $u->getProfile($members[0])->name;
						$sender_photo = $u->getProfile($members[0])->photo;
					}
					else{
						$x = 0;
						foreach ($members as $member) {
							if($x==(sizeof($members)-1)){
								$subject_sidebar_conversation .= $u->getProfile($member)->name;
							}
							else if($x<2){
								$subject_sidebar_conversation .= $u->getProfile($member)->name.", ";	
							}
							$x++;
						}
						if(sizeof($members)>2){
							$subject_sidebar_conversation .= "and ".(sizeof($members)-2)." others";
						}
					}
				}
				$tmp = array(
					"sidebar_conversation_id" => $conversation_item->id,
					"sidebar_conversation_unread" => $conversations->getCountUnreadMessage($conversation_item->id, $id),
					"sidebar_conversation_sender_photo" => $sender_photo,
					"sidebar_conversation_subject" => $subject_sidebar_conversation,
					"sidebar_conversation_submit" => $conversation_item->time_last_message,
					"sidebar_conversation_participants" => "( ".(sizeof($conversations->getMembers($conversation_item->id, $id))+1)." Participants)",
					"sidebar_conversation_last_message" => $conversation_item->last_message,
				);
				array_push($dataConversation, $tmp);
			}
			$conversation = new Conversation();
	        $u = new User_model();
	        $listConversation = $u->getAllConversationUser($this->session->userdata('user_id'));
	        $countUnreadMessage = 0;
	        foreach ($listConversation as $conversations) {
	          $countUnreadMessage += $conversation->getCountUnreadMessage($conversations->id, $this->session->userdata('user_id'));
	        }
			$data = array(
				"sidebar_conversation_entries" => $dataConversation,
				"sidebar_conversation_total" => $countUnreadMessage,
				);
			$content_sidebar_conversation = $this->parser->parse("sidebar_conversation", $data, true);
			$data = array(
					"content_conversation" => $content_conversation,
					"content_sidebar_conversation" => $content_sidebar_conversation
				);
			$content_website = $this->parser->parse('template_conversation', $data, TRUE);
			$menubar = $this->home_viewer->getMenubar();
			$data = array(
						"menubar" => $menubar,
						"content_website" => $content_website,
					);
			$this->parser->parse('template_content', $data);
		}else redirect(base_url('index.php/home/login'));
	}

	/*
		digunakan untuk menambah sebuah conversation 
	*/
	public function addConversation(){
		$users = explode(",", $this->input->post("users"));
		$subject = $this->input->post("subject");
		$message = $this->input->post("message");
		$user_id = $this->session->userdata("user_id");
		$u = new User_model();
		$conversations = new Conversation();
		$listConversation = $u->getAllConversationUser($user_id);
		$find_conversation = null;
		$success = true;
		foreach ($listConversation as $conversation) {
			$listMember = $conversations->getMembers($conversation->id, $user_id);
			$all_member_found = true;
			if(sizeof($users)==sizeof($listMember)){
				foreach ($users as $member) {
					if(!in_array($member, $listMember)){
						$all_member_found = false;
					}
				}
				if($all_member_found){
					$find_conversation = $conversation->id;
				}
			}
		}
		if(!empty($find_conversation)){
			$this->addmessage($find_conversation);
		}
		else{
			$conversation_id = $conversations->addConversation($subject, $user_id);
			foreach ($users as $user) {
				if(!$conversations->addConversation($subject, $user, $conversation_id)){
					$success = false;
				}
			}
			$messages = new Message();
			if($messages->addMessage($conversation_id, $message, $user_id)){
				$success = true;
			}
			else{
				$success = false;
			}
		}
		if($success){
			$alert = "<div id='alert-notification' data-message='Success Create New Conversation' data-status='success' class='hidden'></div>";	
		}
		else{
			$alert = "<div id='alert-notification' data-message='Failed Create New Conversation' data-status='failed' class='hidden'></div>";
		}
		$this->session->set_flashdata('alert-notification', $alert);
		redirect(base_url()."index.php/user/message");
	}

	/*
		digunakan untuk menambahkan sebuah message ke conversation 
	*/
	public function addMessage($conversation_id){
		$message = $this->input->post("message");
		$messages = new Message();
		if($messages->addMessage($conversation_id, $message, $this->session->userdata("user_id"))){
			$alert = "<div id='alert-notification' data-message='Success Send Message' data-status='success' class='hidden'></div>";	
		}
		else{
			$alert = "<div id='alert-notification' data-message='Failed Send Message' data-status='failed' class='hidden'></div>";
		}
		$this->session->set_flashdata('alert-notification', $alert);
		redirect(base_url()."index.php/user/message");
	}

	/*
		digunakan untuk menampilkan halaman tidak ditemukan 
	*/
	function pageNotFound(){
		$this->load->library('parser');
		$this->load->model('home_viewer');
		$menubar = $this->home_viewer->getMenubar();
		$content_website = $this->parser->parse('page_not_found', array(), TRUE);
		$data = array(
					"menubar" => $menubar,
					"content_website" => $content_website,
				);
		// $data = array_map("htmlspecialchars", $data);
		$this->parser->parse('template_content', $data);
	}

	/*
		digunakan untuk upload foto profile user 
	*/
	public function uploadProfileUser($id){
		$config['upload_path'] = './images/tmp/user';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '5120';
		$config['overwrite'] = TRUE;
		$config['file_name'] = $id.".jpg";
		$this->upload->initialize($config);
		if(empty($id)){
			if(!empty($this->input->get("id"))){
				$id = $this->input->get("id");
			}
			if(!empty($this->input->post("id"))){
				$id = $this->input->post("id");
			}
		}
		if($this->session->userdata('user_id')!='' && !empty($id)){
			if($this->upload->do_upload('photo-user')){
				$configImage['source_image'] = './images/tmp/user/'.$id.'.jpg';
				$configImage['create_thumb'] = TRUE;
				$configImage['maintain_ratio'] = TRUE;
				$configImage['width']	= 360;
				$configImage['height']	= 360;
				$configImage['image_library'] = 'gd2';
				$this->load->library('image_lib', $configImage);
				if ($this->image_lib->resize())
				{
					unlink('./images/tmp/user/'.$id.'.jpg');
					rename ( './images/tmp/user/'.$id.'_thumb.jpg', './images/tmp/user/'.$id.'.jpg');
					$p1 = "<img src='".base_url()."images/tmp/user/".$id.".jpg' class='file-preview-image'>";
					$p2 = ['caption' => "user-".$id , 'width' => '120px', 'url' => base_url()."images/tmp/user/".$id.".jpg"];
					$result = array(
							"status" => 1,
							"message" => "Upload success",
							'initialPreview' => $p1,
							'initialPreviewConfig' => $p2,
							'append' => false
					);
				}
				else{
					$result = array(
							"status" => 0,
							"message" => "Web server error",
					);
				}
			}
			else{
				$result = array(
						"status" => 0,
						"message" => "Upload failed",
				);
			}
		}
		else{
			$result = array(
					"status" => 0,
					"message" => "Please login first",
			);
		}
		echo json_encode($result);
	}
	
	/*
	 memperoleh semua daftar user
	 */
	public function getAllUsers($flag_email=false){
		$users = new User_model();
		$users->where('id !=', $this->session->userdata("user_id"))->get();
		$listUser = array();
		foreach ($users as $user) {
			if($flag_email){
				$data = array(
						"value" =>$user->email,
						"text" => ucfirst($user->name)." (".$user->email.")",
				);
			}
			else{
				$data = array(
						"value" =>$user->id,
						"text" => ucfirst($user->name)." (".$user->email.")",
				);
			}
			array_push($listUser, $data);
		}
		echo json_encode($listUser, JSON_PRETTY_PRINT);
	}
	/*
	 untuk melakukan pembersihan data sampah baik resep maupun foto
	 */
	public function schedulercleantmp(){
		date_default_timezone_set ('Asia/Jakarta');
		$now = date("Y-m-d H:i:s");
		$now = new DateTime($now);
		$filesuser = scandir("./images/tmp/user");
		$filesstep = scandir("./images/tmp/step");
		$filesrecipe = scandir("./images/tmp/recipe");
		for ($i=2; $i < sizeof($filesuser) ; $i++) {
			if($filesuser[$i]!=="index.html"){
				$filetime = date("Y-m-d H:i:s", filemtime("./images/tmp/user/".$filesuser[$i]));
				$filetime = new DateTime($filetime);
				$diff = date_diff($filetime, $now);
				$diff = $diff->format("%a");
				if($diff>2){
					unlink("./images/tmp/user/".$filesuser[$i]);
				}
			}
		}
		for ($i=2; $i < sizeof($filesstep) ; $i++) {
			if($filesstep[$i]!=="index.html"){
				$filetime = date("Y-m-d H:i:s", filemtime("./images/tmp/step/".$filesstep[$i]));
				$filetime = new DateTime($filetime);
				$diff = date_diff($filetime, $now);
				$diff = $diff->format("%a");
				if($diff>2){
					unlink("./images/tmp/step/".$filesstep[$i]);
				}
			}
		}
		for ($i=2; $i < sizeof($filesrecipe) ; $i++) {
			if($filesrecipe[$i]!=="index.html"){
				$filetime = date("Y-m-d H:i:s", filemtime("./images/tmp/recipe/".$filesrecipe[$i]));
				$filetime = new DateTime($filetime);
				$diff = date_diff($filetime, $now);
				$diff = $diff->format("%a");
				if($diff>2){
					unlink("./images/tmp/recipe/".$filesrecipe[$i]);
				}
			}
		}
		$recipe = new Recipe_model();
		$recipe->where('tmp_status', '1')->get();
		foreach ($recipe as $rcp) {
			$recipetime = date("Y-m-d H:i:s", strtotime($rcp->create_date));
			$recipetime = new DateTime($recipetime);
			$diff = date_diff($recipetime, $now);
			$diff = $diff->format("%a");
			if($diff>2){
				$rcptmp = new Recipe_model();
				$rcptmp->where('id',$rcp->id)->get()->delete();
			}
		}
	}
	
	/*
	 memperoleh pesan yang belum terbaca pada sebuah conversation
	 */
	public function checkConversation($conversation_id=null, $flag_read=false){
		$user_id = $this->session->userdata("user_id");
		if(!empty($conversation_id) && !empty($user_id)){
			$u = new User_model();
			$conversations = new Conversation();
			$unread = $conversations->getCountUnreadMessage($conversation_id, $user_id);
			$listMessage = array();
			if(!empty($unread)){
				$listMessage = $conversations->getAllMessages($conversation_id, $user_id, $flag_read, $unread);
				foreach ($listMessage as $message) {
					$user_photo = $u->getProfile($message->sender_id)->photo;
					$member = $conversations->getMembers($conversation_id, $user_id);
					if(sizeof($member)==1){
						$user_photo = $u->getProfile($member)->photo;
					}
					$message->user_name = $u->getProfile($message->sender_id)->name;
					$message->user_photo = $user_photo;
					$message->sender_id = ($message->sender_id);
				}
			}
			if($flag_read){
				$unread = 0;
			}
			$data = array(
					"status" =>"success",
					"countunread" => $unread,
					"messages" => $listMessage,
			);
		}
		else{
			$data = array(
					"status" =>"failed",
			);
		}
		echo json_encode($data, JSON_PRETTY_PRINT);
	}
	/*
	 memperoleh jumlah message yang belum terbaca
	 */
	public function checkAllConversation($conversation_id = -1){
		$user_id = $this->session->userdata("user_id");
		if(!empty($user_id)){
			$conversation = new Conversation();
			$u = new User_model();
			$listConversation = $u->getAllConversationUser($this->session->userdata('user_id'));
			$countUnreadMessage = 0;
			foreach ($listConversation as $conversations) {
				if($conversation_id!=$conversations->id){
					$countUnreadMessage += $conversation->getCountUnreadMessage($conversations->id, $this->session->userdata('user_id'));
				}
			}
			$data = array(
					"status" =>"success",
					"countunread" => $countUnreadMessage,);
		}
		else{
			$data = array(
					"status" =>"failed",
			);
		}
		echo json_encode($data, JSON_PRETTY_PRINT);
	}
	/*
	 melakukan pemeriksaan bila ada conversation baru
	 */
	public function checkNewConversation(){
		date_default_timezone_set("Asia/Jakarta");
		$user_id = $this->session->userdata("user_id");
		if(!empty($user_id)){
			$conversations = new Conversation();
			$conversations->where("user_id", $user_id);
			$conversations->where("submit >=", (new DateTime())->modify("-3 second")->format("Y-m-d H:i:s"));
			$conversations->order_by("submit", "desc");
			$conversations->get();
			$dataconversation = array();
			$u = new User_model();
			foreach ($conversations as $conversation) {
				$tmp = new stdClass();
				$tmp->conversation_id = $conversation->id;
				$tmp->submit = $conversation->submit;
				$msg = $conversations->getAllMessages($conversation->id, $user_id)[0];
				$tmp->last_message = $msg->description;
				$subject = $conversation->subject;
				$user_photo = $u->getProfile($msg->sender_id)->photo;
				$members = $conversations->getMembers($conversation->id, $user_id);
				if(empty($subject)){
					$x = 0;
					foreach ($members as $member) {
						if($x==(sizeof($members)-1)){
							$subject .= $u->getProfile($member)->name;
						}
						else if($x<2){
							$subject .= $u->getProfile($member)->name.", ";
						}
						$x++;
					}
					if(sizeof($members)>2){
						$subject .= "and ".(sizeof($members)-2)." others";
					}
				}
				if(sizeof($members==1)){
					$user_photo = $u->getProfile($members[0])->photo;
				}
				$tmp->subject = $subject;
				$tmp->participant = sizeof($members)+1;
				$tmp->user_photo = $user_photo;
				$tmp->count_unread = $conversations->getCountUnreadMessage($conversation->id, $user_id);
				array_push($dataconversation, $tmp);
			}
			$data = array(
					"status" =>"success",
					"countconversation" => sizeof($dataconversation),
					"conversations" => $dataconversation,
			);
		}
		else{
			$data = array(
					"status" =>"failed",
					"message" =>"please login first",
			);
		}
		echo json_encode($data, JSON_PRETTY_PRINT);
	}

	/*
		digunakan untuk pengecekan sebuah resep bila telah termasuk kedalam favorite 
	*/
	public function checkFavorite($recipe_id=null){
		if(empty($recipe_id)){
			if(!empty($this->input->get("id"))){
				$recipe_id = $this->input->get("id");
			}
			if(!empty($this->input->post("id"))){
				$recipe_id = $this->input->post("id");
			}
		}
		$user_id = $this->session->userdata('user_id');
		$result=array();
		if(!empty($user_id) && !empty($recipe_id)){
			$favorite = new Favorite();
			if($favorite->where('recipe_id', $recipe_id)->where("user_id", $user_id)->count()>0){
				$result = array(
						"statusFav" => 1,
				);
			}
			else{
				$result = array(
						"statusFav" => 0,
				);
			}
		}
		echo json_encode($result);
	}

	/*
		digunakan untuk mengubah status favorite sebuah resep 
	*/
	public function setFavorite($recipe_id=null){
		if(empty($recipe_id)){
			if(!empty($this->input->get("id"))){
				$recipe_id = $this->input->get("id");
			}
			if(!empty($this->input->post("id"))){
				$recipe_id = $this->input->post("id");
			}
		}
		$user_id = $this->session->userdata('user_id');
		if(!empty($user_id) && !empty($recipe_id)){
			$user = new User_model();
			$status = $user->addFavorite($user_id, $recipe_id);
			if($status){
				if(strtolower($status['action']) === "delete"){
					$result = array(
							"status" => 1,
							"message" => "Delete Recipe from Favorite Success",
					);
				}
				if(strtolower($status['action']) === "add"){
					$result = array(
							"status" => 1,
							"message" => "Successfully Added Recipe to Your Favorite",
					);
				}
			}
			else{
				$result = array(
						"status" => 0,
						"message" => "There are error in server",
				);
			}
		}
		else{
			$result = array(
					"status" => 0,
					"message" => "Please login first",
			);
		}
		echo json_encode($result);
	}
	
	/*
		digunakan untuk mengubah status cook later sebuah resep 
	*/
	public function setCookLater($recipe_id=null){
		if(empty($recipe_id)){
			if(!empty($this->input->get("id"))){
				$recipe_id = $this->input->get("id");
			}
			if(!empty($this->input->post("id"))){
				$recipe_id = $this->input->post("id");
			}
		}
		$user_id = $this->session->userdata('user_id');
		if(!empty($user_id) && !empty($recipe_id)){
			$user = new User_model();
			$status = $user->addCookLater($user_id, $recipe_id);
			if($status){
				if(strtolower($status['action']) === "delete"){
					$result = array(
							"status" => 1,
							"message" => "Delete Recipe from Cook Later Success",
					);
				}
				if(strtolower($status['action']) === "add"){
					$result = array(
							"status" => 1,
							"message" => "Recipe Added to Your Cook Later",
					);
				}
			}
			else{
				$result = array(
						"status" => 0,
						"message" => "There are error in server",
				);
			}
		}
		else{
			$result = array(
					"status" => 0,
					"message" => "Please login first",
			);
		}
		echo json_encode($result);
	}

	/*
		digunakan untuk memeriksa status cook later sebuah resep 
	*/
	public function checkCL($recipe_id=null){
		if(empty($recipe_id)){
			if(!empty($this->input->get("id"))){
				$recipe_id = $this->input->get("id");
			}
			if(!empty($this->input->post("id"))){
				$recipe_id = $this->input->post("id");
			}
		}
		$user_id = $this->session->userdata('user_id');
		$result=array();
		if(!empty($user_id) && !empty($recipe_id)){
			$CL = new Cooklater();
			if($CL->where('recipe_id', $recipe_id)->where("user_id", $user_id)->count()>0){
				$result = array(
						"statusCL" => 1,
				);
			}
			else{
				$result = array(
						"statusCL" => 0,
				);
			}
		}
		echo json_encode($result);
	}

	/*
		digunakan untuk mengubah status finish sebuah resep pada cook later
	*/
	public function setFinished($recipe_id=null){
		if(empty($recipe_id)){
			if(!empty($this->input->get("id"))){
				$recipe_id = $this->input->get("id");
			}
			if(!empty($this->input->post("id"))){
				$recipe_id = $this->input->post("id");
			}
		}
		$user_id = $this->session->userdata('user_id');
		if(!empty($user_id) && !empty($recipe_id)){
			$c = new Cooklater();
			if($c->setFinishedCookLater($user_id, $recipe_id, '1')){
				$result = array(
						"status" => 1,
						"message" => "<div class='text-center'>Your recipe has been moved to finished recipe.</div>",
				);
			}
			else{
				$result = array(
						"status" => 0,
						"message" => "<div class='text-center'>Failed To Unpublished Your Recipe.</div>",
				);
			}
		}
		else{
			$result = array(
					"status" => 0,
					"message" => "<div class='text-center'>Please Login First</div>",
			);
		}
		echo json_encode($result);
	}
}
