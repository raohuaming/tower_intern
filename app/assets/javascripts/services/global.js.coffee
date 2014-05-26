window.app.factory 'Global', ['$rootScope', ($rootScope) ->
  class Global
    @currentUser: ->
      window.user

    @setCurrentUser: (user) ->
      window.user = user

    @authenticated: ->
      return !! window.user
]
