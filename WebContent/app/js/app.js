var myapp = angular.module('myapp', ['ngRoute','ngResource',
                                     'myapp.controllers',
                                     'myapp.services',
                                     'myapp.directives',
                                     'underscore','ngCookies'
                                     ]);
myapp.config(['$routeProvider',function($routeProvider) {


	$routeProvider.
	when('/signin', {templateUrl: 'app/partials/signin.html',controller:'signincontroller'}).
	when('/signup', {templateUrl: 'app/partials/signup.html',controller:'signupcontroller'}).
	when('/admin', {templateUrl: 'app/partials/adminsignin.html'}).  
	when('/candidate', {templateUrl: 'app/partials/candidatesignin.html'}).
	when('/exam', {templateUrl: 'app/partials/get_exam.html'}). 
	when('/exam/new', {templateUrl: 'app/partials/new_exam.html'}).
	when('/exam/:exam_id/edit', {templateUrl: 'app/partials/edit_exam.html'}).
	when('/exam/:exam_id/show', {templateUrl: 'app/partials/exam_details.html'}).
	when('/student/:id/show', {templateUrl: 'app/partials/student_info.html'}).
	when('/allexams/:id', {templateUrl: 'app/partials/all_exams.html'}).
	when('/currentexams/:id', {templateUrl: 'app/partials/current_exams.html'}).
	when('/students', {templateUrl: 'app/partials/students_all.html'}). 
	when('/over', {templateUrl: 'app/partials/over.html'}).
	when('/invalid', {templateUrl: 'app/partials/invalid.html'}).
	when('/startexam/:examid', {templateUrl: 'app/partials/start_exam.html'}).
	when('/setexam', {templateUrl: 'app/partials/setexam.html'}).
	otherwise({
		redirectTo: ''
	});

}]);