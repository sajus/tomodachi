var cntrlObject =angular.module('myapp.controllers', []);

cntrlObject.controller('signupcontroller',["domoExamService", "$scope", "$window","$location",function(domoExamService, $scope, $window,$location) {
	$scope.location = $location;
		$scope.addUser = function() {
			domoExamService.submit($scope.newUser);
			alert("Signed up! Welcome " + $scope.newUser.username);
			$scope.newUser = {};
			console.log($scope.userId);
			$window.location.href = '#/';
		};

}])

.controller('usercontroller',["domoExamService", "$scope", "$routeParams", "$window", "$rootScope", "$cookies",
                                function(domoExamService, $scope, $routeParams, $window, $rootScope, $cookies) 
                                {
	$scope.userid = $cookies.userid;
                                }])
.controller('signincontroller',["domoExamService", "$scope", "$routeParams", "$window", "$rootScope", "$cookies",
                                function(domoExamService, $scope, $routeParams, $window, $rootScope, $cookies) 
                                {
	$scope.userRole = [];
	$scope.signinUser = function(userid,password) {
		$routeParams.userid = userid;
		$routeParams.password = password;
		$scope.userRole=domoExamService.signin({
			userid : $routeParams.userid,
			password : $routeParams.password
		}, function(data) {
			console.log("parameters passed");
			console.log(data);
			$cookies.userid = $scope.userid;
			$window.location.href = "#/"+ data[0];
		});
		//$scope.userRole = {};
	};

                                }]).controller('examcontroller',["examService","$scope", "$routeParams", "$window", "$rootScope","$timeout", function(examService, $scope, $routeParams, $window, $rootScope,$timeout)
                                                               {

                                	$scope.createexam = function() {				
                                		examService.createExam($scope.newcandidate);
                                		$scope.newcandidate= {};
                                	};
                                                                 }]);
