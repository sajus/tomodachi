angular.module('myapp.controllers').controller('userController',["authenticationService", "$scope", "$routeParams", "$window", "$rootScope",function(authenticationService, $scope, $routeParams, $window, $rootScope){
	if (localStorage.getItem("userid")  != 'null'){ 
	  $scope.userid = localStorage.getItem("userid");
	} else {
		$window.location.href = "index.html";
	}
}]);