/*
  The goal of this file is mainly to intialize require.js AMD module loader configuration.
  Your application code should not be here but in apps.js
*/
requirejs.config({
    /*
      The path where your JavaScripts are located.
    */
    baseUrl: './app/',

    map: {
      '*': {
          'css': 'lib/require/plugins/require-css/css.min'
      }
    },

    /*
      Path config is also part of Require and allows to define paths for vendors
      not found directly under baseUrl.
      See http://requirejs.org/docs/api.html#config-paths for details.
    */
    paths: {

      /* List of frameworks/libraries to be included in this architecture. */
      'angular': 'lib/angular/angular',
      'angular-route': 'lib/angular/angular-route',
      'angular-resource': 'lib/angular/angular-resource',
      'bootstrap': 'lib/bootstrap/js/bootstrap.min',
      'jquery': 'lib/jQuery/jquery-2.2.3.min',
      /* List of Require plugins */
      'text': 'lib/require/plugins/text'
    },

    /*
        shim config is part of `Require 2.0`_ and allows to Configure the dependencies
        and exports for older, traditional “browser globals” scripts that do not use
        define() to declare the dependencies and set a module value.
        See http://requirejs.org/docs/api.html#config-shim for more details.
    */
    shim: {
      'bootstrap': {
        deps: ['jquery']
      },
      'angular-route': {
        deps: ['angular']
      },
      'angular-resource': {
        deps: ['angular']
      }
    }
});

///* Load app.js to initialize your application module. */
require(['js/app'], function(App) {
});
