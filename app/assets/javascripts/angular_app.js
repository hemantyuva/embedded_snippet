var app = angular.module('articlesEmbedded', ['ngRoute', 'ngResource'])

// Factory

app.factory('Articles', ['$resource',function($resource){
  return $resource('/admin/articles.json', {},{
    create: { method: 'POST' }
  })
}]);

// Routes

// app.config(['$routeProvider',function($routeProvider) {
// 	$routeProvider.when("/admin/articles", {
// 		templateUrl : "/admin/articles/index.html",
// 		controller : "MainCtrl"
// 	});
// }]);

 // Controller

app.controller("MainCtrl",['$scope',"$location", '$http', '$resource', 'Articles', function ($scope, $location,$http, $resource, Articles,TokenHandler) {
  $scope.user = {};
  $scope.addPost = function(){
  	Articles.create({user: this.article}, function(data){
      window.location.href = '/admin/articles/'+data.id;
    }, function(error){
      });
  }
}]);