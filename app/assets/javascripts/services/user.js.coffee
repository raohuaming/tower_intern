window.app.factory 'User', ['$resource', ($resource) ->
  return $resource '/users/:id/:action.json', { id: '@id', action: '@action' },
    {

    }
]
