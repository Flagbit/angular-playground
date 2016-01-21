NavController = ($scope, $route, $location) ->
  __construct = ->
    filterRoutes()

  $scope.routes = []

  $scope.clickHandler = (route) -> $location.path route.originalPath

  filterRoutes = ->
    for path,route of $route.routes
      unless route.redirectTo
        $scope.routes.push route

  __construct()

app.controller "NavController", NavController
