define(function(require) {

  function loadApplicationModules() {
    require([
    'js/login/app'
    ], function(
      loginApp
    ) {
      console.log('Loaded Modules');
    });
  }

  return loadApplicationModules;

});