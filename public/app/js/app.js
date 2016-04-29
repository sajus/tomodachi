/*
*  Application level app file for bootstraps and initialization
*/
//
//define(['require', 'angular', 'js/core/app', 'angular-route'], function(require, angular, loadApplicationModules) {
//  'use strict';
//  require(['domReady!'], function (document){
//    var $root = angular.element(document.getElementById('application'));
//    angular.bootstrap($root);
//    var app = angular.module('tomodachi', ['ngRoute', 'tomodachi.controllers', ]);
//    //loadApplicationModules();
//
//    app.config(['$routeProvider','$locationProvider'],function($routeProvider, $locationProvider) {
//        $routeProvider.when('login', {
//          template:'<div>TEST</div>',
//          //controller: 'loginController'
//        });
//        $locationProvider.html5Mode(true);
//        console.log("sds");
//      });
//  });
//});

//var myapp = angular.module('myapp', ['ngRoute','ngResource', 'myapp.controllers','myapp.services','myapp.directives','ngCookies']);
//myapp.config(['$routeProvider',function($routeProvider) {
//  $routeProvider
//	.when('/signin', {templateUrl: 'app/partials/signin.html'})
//	.when('/signup', {templateUrl: 'app/partials/signup.html'})
//	.when('/logout', {templateUrl: 'log_out.html'})
//	.when('/examinfo', {templateUrl: 'app/partials/get_exam_info.html'})
//	.when('/studentinfo', {templateUrl: 'app/partials/get_student_info.html'})
//	.when('/exam/new', {templateUrl: 'app/partials/set_exam.html'})
//	.when('/exam/:exam_id/edit', {templateUrl: 'app/partials/edit_exam.html'})
//	.when('/exam/:exam_id/show', {templateUrl: 'app/partials/exam_details.html'})
//	.when('/student/:id/show', {templateUrl: 'app/partials/student_info.html'})
//	.when('/previousexams/:id', {templateUrl: 'app/partials/previous_exams.html'})
//	.when('/currentexams/:id', {templateUrl: 'app/partials/current_exams.html'})
//	.when('/invalid', {templateUrl: 'app/partials/invalid.html'})
//	.when('/startexam/:examid', {templateUrl: 'app/partials/start_exam.html'})
//	.when('/setexam', {templateUrl: 'app/partials/setexam.html'})
//	.otherwise({
//	  redirectTo: ''
//	});
//}]);
define(function() {
  var app = angular.module('tomodachi', ['ngRoute']);

  app.config([
    '$routeProvider',
    '$locationProvider',
    '$controllerProvider',
    '$compileProvider',
    '$filterProvider',
    '$provide',

    function($routeProvider, $locationProvider, $controllerProvider, $compileProvider, $filterProvider, $provide) {
      app.controller = $controllerProvider.register;
      app.directive  = $compileProvider.directive;
      app.filter     = $filterProvider.register;
      app.factory    = $provide.factory;
      app.service    = $provide.service;

      $locationProvider.html5Mode(true);
    }
  ]);

 return app;
});