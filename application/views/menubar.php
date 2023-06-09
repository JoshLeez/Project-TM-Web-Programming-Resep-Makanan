<div class="navmenu navmenu-default navmenu-fixed-left offcanvas bg-sidemenu" role="navigation">
  <div class="col-xs-12 text-center page-header-title">
    <a href="<?php echo base_url();?>" class="brand-menubar col-no-padding-left">
     <img class="img-responsive img-brand-menubar" src="<?php echo base_url();?>assets/img/JoshLeeRecipe.png" style="padding-top: 5px;"/>
    </a>  
  </div>
  <div id="btn-group-slide-menu" class="col-xs-12 text-center col-no-padding">
    <div class="col-xs-12">
      <form id='loginform-slide-menu' class='form-horizontal hidden' role='form' method='post' action='<?php echo base_url();?>index.php/home/login'>      
        <div class='input-group'>
            <span class='input-group-addon button-secondary'><i class='fa fa-user'></i></span>
            <input id='login-username' type='text' class='form-control' name='email' value='' placeholder='Email' required>                                        
        </div><br>        
        <div class='input-group'>
                    <span class='input-group-addon button-secondary'><i class='fa fa-lock'></i></span>
                    <input id='login-password' type='password' class='form-control' name='password' placeholder='Password' required>
                </div>
        <div style='margin-top:10px' class='form-group'>
            <div class='col-sm-12 controls text-center'>
              <button id='btn-signin' type='submit' class='btn button-secondary'>Login</button>
            </div>
        </div>
        <div class='form-group'>
            <div class='col-md-12 control'>
                <div class="border-solid-top" style='padding-top:15px; font-size:85%; color:#000'>
                    Forgot password? 
                <a href='<?php echo base_url();?>index.php/user/forgotpassword'>
                    Remember Here
                </a>
                </div>
            </div>
        </div>    
      </form>
    </div>
    <div class="btn-group col-xs-12" role="group">
      <button type="button" class="btn button-secondary inverse btn-cus" id="btn-login-slide-menu" style="width:120px">Login</button>
      <a id="btn-join-slide-menu" href="<?php echo base_url();?>index.php/user/join" class="btn-group">
        <button type="button" class="btn button-secondary" style="width:120px">Join</button>
      </a>
    </div>
  </div>
</div>
<nav class="navbar navbar-default navbar-fixed-top bg-foodoof">
  <div class="container">
    <div class="navbar-header col-md-2 col-no-padding-right mobile-hidden" style="padding-bottom:10px">
      <button type="button" class="navbar-toggle navbar-toggle-foodoof" data-toggle="offcanvas" data-target=".navmenu" data-canvas="body" data-placement='left' style="margin:21px 10px 21px 10px">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar icons-secondary"></span>
          <span class="icon-bar icons-secondary"></span>
          <span class="icon-bar icons-secondary"></span>
      </button>
      <a href="<?php echo base_url();?>" class="brand-menubar col-no-padding-left col-md-12 col-xs-9">
        <img class="img-responsive img-brand-menubar" src="<?php echo base_url();?>assets/img/JoshLeeRecipe.png" style="padding-top: 30px;"/>
      </a>
      <a href="<?php echo base_url();?>index.php/recipe/create" class="btn-navbar-mobile pull-right text-center">
        <i class="fa fa-pencil-square-o fa-2x icons-secondary">
        </i><br>Write <br>A Recipe
      </a>
    </div>
    <div class="navbar-header col-md-2 mobile-visible" style="padding-bottom:10px">
      <a href="<?php echo base_url();?>index.php/recipe/create" class="btn-navbar-mobile pull-right text-center">
        <i class="fa fa-pencil-square-o fa-2x icons-secondary">
        </i><br>Write <br>A Recipe
      </a>
      <a href="<?php echo base_url();?>" class="brand-menubar col-md-12 col-xs-9 pull-right text-center">
        <img class="img-responsive img-brand-menubar" src="<?php echo base_url();?>assets/img/JoshLeeRecipe.png" style="padding-top: 30px; margin:auto"/>
      </a>
      <button type="button" class="navbar-toggle navbar-toggle-foodoof pull-left" data-toggle="offcanvas" data-target=".navmenu" data-canvas="body" data-placement='left' style="margin:21px 10px 21px 10px">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar icons-secondary"></span>
          <span class="icon-bar icons-secondary"></span>
          <span class="icon-bar icons-secondary"></span>
      </button>
    </div>
    <div id="navbar" class="col-md-10">
      <form id="form-search" class="collapse-navbar-search col-md-7 col-no-padding-right" method="get" action="<?php echo base_url();?>index.php/search">
        <div class="input-group form-group search-bar-menu">
          <span class="input-group-btn"> 
            <div class="btn-group">
              <button class="btn dropdown-cat-search button-secondary" data-toggle="dropdown" aria-expanded="false" title="Search Recipe By Title">
                <i class="fa fa-cutlery fa-lg"></i>
              </button>
              <ul id="listSearch" class="dropdown-menu dropdown-menu-search bullet pull-center">
                <li>
                  <input type="radio" id="ex1_1" value='title' name="searchby" checked/>
                  <label for="search-title">
                    <i class="fa fa-cutlery fa-lg"></i><span style="margin-left:15px">Title </span>
                  </label>
                </li>
                <li>
                  <input type="radio" id="ex1_2" value='ingredient' name="searchby" required/>
                  <label for="search-ingredient">
                    <i class="icon-basket" style="font-size:1.333em"></i><span style="margin-left:15px">Ingredient </span>
                  </label>
                </li>
                <li>
                  <input type="radio" id="ex1_3" value='account' name="searchby"/>
                  <label for="search-account">
                    <i class="fa fa-user fa-lg"></i><span style="margin-left:15px">Account </span>
                  </label>
                </li>
              </ul>
            </div>
          </span>
          <input type="search" id="searchbar" class="form-control search-title" name="q" class="typeahead" autocomplete="off" placeholder="Search Recipe By Title">
          <span class="input-group-btn">
            <button type="submit" class="btn button-secondary button-group-normal">
               <i class="fa fa-search"></i>
            </button>
          </span>
        </div>
      </form>
      <div class="col-md-4 navbar-collapse collapse col-menu-user col-no-padding-right" style="padding-left:20px; width: 380px;">
        <div class="col-md-2">
        </div>
        <div class="col-md-2 link-by-icon text-center" >
          <a id="createRecipeMenubar" title="New Recipe">
            <i class="fa fa-pencil-square-o fa-2x icons-secondary" style="cursor:pointer"></i>
          </a>
        </div>
        <div class="col-md-8 col-no-padding-right">
          <div class="btn-group" role="group" aria-label="" style="padding-left: 40px; ">
            <button type="button" class="btn btn-cus btn-popover nav-bar-btn button-secondary inverse" data-container="body" data-toggle="popover" data-placement="bottom" 
            data-html="TRUE"
            data-content="
              <form id='loginform' class='form-horizontal' role='form' method='post' action='<?php echo base_url();?>index.php/home/login'>      
                  <div class='input-group'>
                      <span class='input-group-addon button-secondary'><i class='fa fa-user'></i></span>
                      <input id='login-username' type='text' class='form-control' name='email' value='' placeholder='Email' required>                                        
                  </div><br>        
                  <div class='input-group'>
                              <span class='input-group-addon button-secondary'><i class='fa fa-lock'></i></span>
                              <input id='login-password' type='password' class='form-control' name='password' placeholder='Password' required>
                          </div>
                  <div style='margin-top:10px' class='form-group'>
                      <div class='col-sm-12 controls text-center'>
                        <button id='btn-signin' type='submit' class='btn button-secondary'>Login</button>
                      </div>
                  </div>
                  <div class='form-group'>
                      <div class='col-md-12 control'>
                          <div style='border-top: 1px solid#888; padding-top:15px; font-size:85%' >
                              Forgot password? 
                          <a href='<?php echo base_url();?>index.php/user/forgotpassword'>
                              Remember Here
                          </a>
                          </div>
                      </div>
                  </div>    
              </form>
            "
            >
            Login    
            </button>
            <a href="<?php echo base_url();?>index.php/user/join"  class="btn-group">
              <button type="button" class="btn button-secondary btn-cus nav-bar-btn">Join</button>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</nav>