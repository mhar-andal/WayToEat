$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".login-register").on("submit", "form" ,function(e) {
    e.preventDefault();
    var form = $(this)
    var formdata = $(this).serialize();
    var btn = $(this).find("input[type=submit]:focus" );

    if(btn.attr("id") == "login-submit") {
      console.log('login')
       $.ajax({
         method: 'post',
         url: '/sessions',
         data: formdata
       })
       .done(function(response) {
         window.location = "http://localhost:9393/";
       });
    } else {
      $.ajax({
        method: 'post',
        url: '/users',
        data: formdata
      })
      .done(function(response) {
        window.location = "http://localhost:9393/";
      });
    }

  });

  $("#navbar-id").on("submit", "#logout-button", function(e) {
    e.preventDefault();
    $.ajax({
      method: 'delete',
      url: '/sessions'
    })
    .done(function() {
      window.location = "http://localhost:9393/";
    });
  })

});
