FilterController = ($scope) ->
  __construct = ->
    price = 0
    for item in [0..5000]
      price += 0.5
      $scope.items.push
        name: "Item Number #{item}"
        price: price

    getHighestPrice()

  getHighestPrice = ->
    max = 0
    for item in $scope.items
      if item.price > max then max = item.price
    $scope.max = max
    $scope.range.to = max

  $scope.layouts = ["column", "row"]

  $scope.layoutItems =
    row: "column"
    column: "row"

  $scope.itemsPerPage =
    row: 12
    column: 6

  $scope.selectedLayout = $scope.layouts[0]

  $scope.items = []

  $scope.range =
    from: 0
    to: 0

  $scope.max = null

  __construct()

app.controller "FilterController", FilterController
