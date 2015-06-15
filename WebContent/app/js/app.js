var myapp = angular.module('myapp', ['ngRoute','ngResource',
                                     'myapp.controllers',
                                     'myapp.services',
                                     'myapp.directives',
                                     'underscore'
                                     ]);
myapp.config(['$routeProvider',function($routeProvider) {
	$routeProvider.
	when('/signin', {templateUrl: 'app/partials/signin.html',controller:'signincontroller'}).
	when('/signup', {templateUrl: 'app/partials/signup.html',controller:'signupcontroller'}).
	when('/admin', {templateUrl: 'app/partials/adminsignin.html'}).  
	when('/candidate', {templateUrl: 'app/partials/candidatesignin.html'}).
	when('/exams', {templateUrl: 'app/partials/get_exam.html'}). 
	when('/exam/show', {templateUrl: 'app/partials/exam_details.html'}).
	when('/students', {templateUrl: 'app/partials/students_all.html', controller:'examcontroller'}).  
	when('/exam/new', {templateUrl: 'app/partials/new_exam.html', controller:'examcontroller'}).
	when('/exam/:exam_id/edit', {templateUrl: 'app/partials/edit_exam.html', controller:'examcontroller'}).
	when('/student/:id/show', {templateUrl: 'app/partials/student_info.html', controller:'examcontroller'}).
	when('/startexam', {templateUrl: 'app/partials/start_exam.html', controller:'examcontroller'}).
	when('/setexam', {templateUrl: 'app/partials/setexam.html'}).
	when('/over', {templateUrl: 'app/partials/over.html'}).
	when('/invalid', {templateUrl: 'app/partials/signin.html'}).
	otherwise({
		redirectTo: ''
	});
}]);




