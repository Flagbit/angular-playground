FinderController = ($scope) ->
  __construct = ->
    console.log "Finder INIT"

  $scope.manufacturers = [
    "Aprilia"
    "BMW"
    "Ducati"
  ]

  $scope.models = [
    {name: "Model A", manufacturer: "Aprilia"}
    {name: "Model B", manufacturer: "Aprilia"}
    {name: "Model C", manufacturer: "Aprilia"}
    {name: "Model D", manufacturer: "Aprilia"}
    {name: "Model E", manufacturer: "BMW"}
    {name: "Model F", manufacturer: "BMW"}
    {name: "Model G", manufacturer: "BMW"}
    {name: "Model H", manufacturer: "Ducati"}
    {name: "Model I", manufacturer: "Ducati"}
    {name: "Model J", manufacturer: "Ducati"}
    {name: "Model K", manufacturer: "Ducati"}
    {name: "Model L", manufacturer: "Ducati"}
  ]

  $scope.modelFilter

  $scope.message = "Hello World"

  __construct()

app.controller "FinderController", FinderController
