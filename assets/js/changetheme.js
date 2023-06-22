$(function() {
  $('#tema').change(function() {
    setTimeout(function(){
      window.location = '/Resep-Makanan/index.php/home/changeTheme?url='+encodeURI(window.location.toString());
    }, 500);
  });
});