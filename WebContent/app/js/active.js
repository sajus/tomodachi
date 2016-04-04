$(".active").click(function () {
    $('a').removeClass("active-tab"); //Remove any "active" class 
    $(this).addClass("active-tab"); //Add "active" class to selected tab
});