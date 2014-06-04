app = angular.module('rorla', [])

app.controller 'PostsCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.posts = []
  $scope.formData = {}

  fetchPosts = ->
    $http.get(api.urls.posts).success (data) ->
      $scope.posts = data.reverse()

  $scope.submitForm = ->
    $http.post(api.urls.posts, post: $scope.formData).success (data) ->
      $scope.formData = {}
      fetchPosts()

  fetchPosts()
]
