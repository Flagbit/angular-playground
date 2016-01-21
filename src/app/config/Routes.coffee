app.config ($routeProvider) ->
  $routeProvider
    .when "/",
      controller: "IndexController"
      templateUrl: "assets/app/views/index/index.html"
      title: "Home"
    .when "/finder",
      controller: "FinderController"
      templateUrl: "assets/app/views/finder/index.html"
      title: "Finder"
    .when "/filter",
      controller: "FilterController"
      templateUrl: "assets/app/views/filter/index.html"
      title: "Filter"
    .when "/register",
      controller: "RegisterController"
      templateUrl: "assets/app/views/register/index.html"
      title: "Register"
    .otherwise
      redirectTo: "/index"
