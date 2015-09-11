angular.module('myapp.controllers').controller('logOutController',["authenticationService", "$scope", "$routeParams", "$window", "$rootScope", "$location",function(authenticationService, $scope, $routeParams, $window, $rootScope, $location){
	localStorage.setItem("userid", null);
}]);