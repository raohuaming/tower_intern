window.app.factory 'Session', ['$resource', ($resource) ->
  return $resource '/session/:action.json', { action: '@action' },
    {

    }
]
