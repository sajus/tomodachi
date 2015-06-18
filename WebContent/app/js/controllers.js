var cntrlObject =angular.module('myapp.controllers', []);

cntrlObject.controller('signupcontroller',["domoExamService", "$scope", "$window","$location",function(domoExamService, $scope, $window,$location) {
	$scope.location = $location;
		$scope.addUser = function() {
			domoExamService.submit($scope.newUser);
			alert("Signed up! Welcome " + $scope.newUser.username);
			$scope.newUser = {};
			$window.location.href = '#/';
		};

}])
.controller('signincontroller',["domoExamService", "$scope", "$routeParams", "$window", "$rootScope",
                                function(domoExamService, $scope, $routeParams, $window, $rootScope) 
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
			//console.log($scope.userRole);
			$window.location.href = "#/"+ data[0];

		});
		$scope.userRole = {};
	};
                                }]).controller('examcontroller',["examService","$scope", "$routeParams", "$window", "$rootScope","$timeout", "$location",function(examService, $scope, $routeParams, $window, $rootScope,$timeout,$location)
                                                                 {
                                
                                	$scope.createexam = function() {				
                                		examService.createExam($scope.newcandidate);
                                		$scope.newcandidate= {};
                                	};
                                                                 }]);
