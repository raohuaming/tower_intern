# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.app.controller 'UserController', ['$scope', '$log', ($scope, $log) ->
  $scope.register = (user) ->
    $log.debug "#{user.name} #{user.email} #{user.password}"
]
