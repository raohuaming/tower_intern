window.app = app = angular.module 'towerApp', ['ngResource', 'ui.router', 'ui.bootstrap']

app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
