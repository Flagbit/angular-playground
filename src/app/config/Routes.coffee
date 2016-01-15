app.config ($routeProvider) ->
  $routeProvider
    .when "/finder",
      controller: "FinderController"
      templateUrl: "assets/app/views/finder/index.html"
    .when "/filter",
      controller: "FilterController"
      templateUrl: "assets/app/views/filter/index.html"
    .when "/register",
      controller: "RegisterController"
      templateUrl: "assets/app/views/register/index.html"
    .otherwise
      redirectTo: "/finder"
