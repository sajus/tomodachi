var myapp = angular.module('myapp', ['ngRoute','ngResource', 'myapp.controllers','myapp.services','myapp.directives', 'underscore','ngCookies']);
myapp.config(['$routeProvider',function($routeProvider) {
  $routeProvider
	.when('/signin', {templateUrl: 'app/partials/signin.html'})
	.when('/signup', {templateUrl: 'app/partials/signup.html'})
	.when('/logout', {templateUrl: 'log_out.html'})
	.when('/examinfo', {templateUrl: 'app/partials/get_exam_info.html'})
	.when('/studentinfo', {templateUrl: 'app/partials/get_student_info.html'})
	.when('/exam/new', {templateUrl: 'app/partials/set_exam.html'})
	.when('/exam/:exam_id/edit', {templateUrl: 'app/partials/edit_exam.html'})
	.when('/exam/:exam_id/show', {templateUrl: 'app/partials/exam_details.html'})
	.when('/student/:id/show', {templateUrl: 'app/partials/student_info.html'})
	.when('/previousexams/:id', {templateUrl: 'app/partials/previous_exams.html'})
	.when('/currentexams/:id', {templateUrl: 'app/partials/current_exams.html'})
	.when('/invalid', {templateUrl: 'app/partials/invalid.html'})
	.when('/startexam/:examid', {templateUrl: 'app/partials/start_exam.html'})
	.when('/setexam', {templateUrl: 'app/partials/setexam.html'})
	.otherwise({
	  redirectTo: ''
	});
}]);