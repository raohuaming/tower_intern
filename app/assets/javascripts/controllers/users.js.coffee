# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.app.controller 'UserController', ['$scope', '$timeout', '$location', '$log', 'User', 'Global', ($scope, $timeout, $location, $log, User, global) ->
  $scope.register = (user) ->
    User.save user, (user) ->
      global.setCurrentUser(user)
      $scope.signupResult = true
    , (res) ->
      $scope.error_messages = ""
      angular.forEach res.data.errors, (value, key) ->
        $scope.error_messages += value.join(',')
      $timeout ->
        $scope.error_messages = null
      , 3000
]
