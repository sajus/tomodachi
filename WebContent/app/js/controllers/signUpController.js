angular.module('myapp.controllers').controller('signUpController',["authenticationService", "$scope", "$window","$location",function(authenticationService, $scope, $window,$location){
  $scope.location = $location;
  $scope.addUser = function() {
	  console.log($scope.newUser);
	authenticationService.signUp($scope.newUser);
	alert("Signed up! Welcome " + $scope.newUser.username);
	$scope.newUser = {};
	$window.location.href = '#/';
	};
}])