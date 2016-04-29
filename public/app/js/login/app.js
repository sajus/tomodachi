define(function(require) {

  require('app/js/login/login.js');
  require('css!../../../../app/js/login/login.css');

  console.log("Calling Login App START");

  var app = angular.module('tomodachi', ['ngRoute']);
  app.config(['$routeProvider','$locationProvider'],function($routeProvider, $locationProvider) {
    $routeProvider.when('/#login', {
      template:'<div>TEST</div>',
      //controller: 'loginController'
    });
    $locationProvider.html5Mode(true);
    console.log("sds");
  });

  console.log("Calling Login App END");
});