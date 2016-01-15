DndController = ($scope) ->
  __construct = ->
    console.log "DND Controller"
    for item in [0..10]
      $scope.widgets.push {name: "Widget #{item}"}
      $scope.models.lists.A.push {name: "Item A - #{item}"}
      $scope.models.lists.B.push {name: "Item B - #{item}"}

  $scope.widgets = []

  $scope.selectedWidgets = []

  $scope.models =
    selected: null
    lists: {"A": [], "B": []}

  $scope.selected = null

  $scope.removeWidget = (widget) ->
    $scope.selectedWidgets.filter (item, index) -> if item is widget then $scope.selectedWidgets.splice index, 1


  $scope.lastIndex = null

  $scope.placeholder = placeholder: true

  removePlaceholders = (item, index, list) ->
    if item is $scope.placeholder
      list.splice index, 1

  $scope.dropCallback = (event, index, item) ->
    # remove placeholder element
    $scope.selectedWidgets.filter removePlaceholders
    # reset index
    $scope.lastIndex = null
    return item

  $scope.dragoverCallback = (event, index) ->
    # check if index has updated, to prevent unneccessary calculations and DOM updates
    if index isnt $scope.lastIndex
      # save index
      $scope.lastIndex = index
      # delete previously added placeholder element
      $scope.selectedWidgets.filter removePlaceholders
      # add current placeholder element
      $scope.selectedWidgets.splice index, 0, $scope.placeholder
    
    # disable default dragover
    return true

  ###
  $scope.dropCallback = (event, index, item, list) ->
    # remove placeholder element
    list.filter removePlaceholders
    # reset index
    $scope.lastIndex = null
    return item

  $scope.dragoverCallback = (ev, index, list) ->
    # check if index has updated, to prevent unneccessary calculations and DOM updates
    if index isnt $scope.lastIndex
      # save index
      $scope.lastIndex = index
      # delete previously added placeholder element
      list.filter removePlaceholders
      # add current placeholder element
      list.splice index, 0, $scope.placeholder
    
    # disable default dragover
    return true
  ###
  
  __construct()

app.controller "DndController", DndController
