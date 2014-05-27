# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.app.controller 'SessionController', ['$scope', '$timeout', '$log', 'Session', ($scope, $timeout, $log, Session) ->
  $scope.signin = (user) ->
    Session.save user, (user) ->
      $scope.signinResult = true
      $timeout ->
        window.location.href = '/homepage'
      , 1000
    , (res) ->
      $scope.error_messages = ""
      angular.forEach res.data.errors, (value, key) ->
        $scope.error_messages += value
      $timeout ->
        $scope.error_messages = null
      , 3000
]
