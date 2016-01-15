(function() {
  var dependencies;

  dependencies = ["ngRoute", "ngMaterial", "dndLists", "ngRangeSlider", "angularUtils.directives.dirPagination"];

  window.app = angular.module("angular-playground", dependencies);

}).call(this);

(function() {
  var ApplicationController;

  ApplicationController = function($scope) {
    var __construct;
    __construct = function() {
      return console.log("application running");
    };
    return __construct();
  };

  app.controller("ApplicationController", ApplicationController);

}).call(this);

(function() {
  var DndController;

  DndController = function($scope) {
    var __construct, removePlaceholders;
    __construct = function() {
      var i, item, results;
      console.log("DND Controller");
      results = [];
      for (item = i = 0; i <= 10; item = ++i) {
        $scope.widgets.push({
          name: "Widget " + item
        });
        $scope.models.lists.A.push({
          name: "Item A - " + item
        });
        results.push($scope.models.lists.B.push({
          name: "Item B - " + item
        }));
      }
      return results;
    };
    $scope.widgets = [];
    $scope.selectedWidgets = [];
    $scope.models = {
      selected: null,
      lists: {
        "A": [],
        "B": []
      }
    };
    $scope.selected = null;
    $scope.removeWidget = function(widget) {
      return $scope.selectedWidgets.filter(function(item, index) {
        if (item === widget) {
          return $scope.selectedWidgets.splice(index, 1);
        }
      });
    };
    $scope.lastIndex = null;
    $scope.placeholder = {
      placeholder: true
    };
    removePlaceholders = function(item, index, list) {
      if (item === $scope.placeholder) {
        return list.splice(index, 1);
      }
    };
    $scope.dropCallback = function(event, index, item) {
      $scope.selectedWidgets.filter(removePlaceholders);
      $scope.lastIndex = null;
      return item;
    };
    $scope.dragoverCallback = function(event, index) {
      if (index !== $scope.lastIndex) {
        $scope.lastIndex = index;
        $scope.selectedWidgets.filter(removePlaceholders);
        $scope.selectedWidgets.splice(index, 0, $scope.placeholder);
      }
      return true;
    };

    /*
    $scope.dropCallback = (event, index, item, list) ->
       * remove placeholder element
      list.filter removePlaceholders
       * reset index
      $scope.lastIndex = null
      return item
    
    $scope.dragoverCallback = (ev, index, list) ->
       * check if index has updated, to prevent unneccessary calculations and DOM updates
      if index isnt $scope.lastIndex
         * save index
        $scope.lastIndex = index
         * delete previously added placeholder element
        list.filter removePlaceholders
         * add current placeholder element
        list.splice index, 0, $scope.placeholder
      
       * disable default dragover
      return true
     */
    return __construct();
  };

  app.controller("DndController", DndController);

}).call(this);

(function() {
  var FilterController;

  FilterController = function($scope) {
    var __construct, getHighestPrice;
    __construct = function() {
      var i, item, price;
      price = 0;
      for (item = i = 0; i <= 5000; item = ++i) {
        price += 0.5;
        $scope.items.push({
          name: "Item Number " + item,
          price: price
        });
      }
      return getHighestPrice();
    };
    getHighestPrice = function() {
      var i, item, len, max, ref;
      max = 0;
      ref = $scope.items;
      for (i = 0, len = ref.length; i < len; i++) {
        item = ref[i];
        if (item.price > max) {
          max = item.price;
        }
      }
      $scope.max = max;
      return $scope.range.to = max;
    };
    $scope.layouts = ["column", "row"];
    $scope.layoutItems = {
      row: "column",
      column: "row"
    };
    $scope.itemsPerPage = {
      row: 12,
      column: 6
    };
    $scope.selectedLayout = $scope.layouts[0];
    $scope.items = [];
    $scope.range = {
      from: 0,
      to: 0
    };
    $scope.max = null;
    return __construct();
  };

  app.controller("FilterController", FilterController);

}).call(this);

(function() {
  var FinderController;

  FinderController = function($scope) {
    var __construct;
    __construct = function() {
      return console.log("Finder INIT");
    };
    $scope.manufacturers = ["Aprilia", "BMW", "Ducati"];
    $scope.models = [
      {
        name: "Model A",
        manufacturer: "Aprilia"
      }, {
        name: "Model B",
        manufacturer: "Aprilia"
      }, {
        name: "Model C",
        manufacturer: "Aprilia"
      }, {
        name: "Model D",
        manufacturer: "Aprilia"
      }, {
        name: "Model E",
        manufacturer: "BMW"
      }, {
        name: "Model F",
        manufacturer: "BMW"
      }, {
        name: "Model G",
        manufacturer: "BMW"
      }, {
        name: "Model H",
        manufacturer: "Ducati"
      }, {
        name: "Model I",
        manufacturer: "Ducati"
      }, {
        name: "Model J",
        manufacturer: "Ducati"
      }, {
        name: "Model K",
        manufacturer: "Ducati"
      }, {
        name: "Model L",
        manufacturer: "Ducati"
      }
    ];
    $scope.modelFilter;
    $scope.message = "Hello World";
    return __construct();
  };

  app.controller("FinderController", FinderController);

}).call(this);

(function() {
  var RegisterController;

  RegisterController = function($scope) {
    var __construct;
    __construct = function() {};
    return __construct();
  };

  app.controller("RegisterController", RegisterController);

}).call(this);

(function() {
  app.config(function($routeProvider) {
    return $routeProvider.when("/finder", {
      controller: "FinderController",
      templateUrl: "/assets/app/views/finder/index.html"
    }).when("/filter", {
      controller: "FilterController",
      templateUrl: "/assets/app/views/filter/index.html"
    }).when("/register", {
      controller: "RegisterController",
      templateUrl: "/assets/app/views/register/index.html"
    }).otherwise({
      redirectTo: "/finder"
    });
  });

}).call(this);

(function() {
  app.filter("rangeFilter", function() {
    return function(items, range) {
      var filtered, i, item, len, max, min;
      filtered = [];
      min = parseInt(range.from);
      max = parseInt(range.to);
      for (i = 0, len = items.length; i < len; i++) {
        item = items[i];
        if (item.price >= min && item.price <= max) {
          filtered.push(item);
        }
      }
      return filtered;
    };
  });

}).call(this);

(function() {
  app.filter("startFrom", function() {
    return function(input, start) {
      start = +start;
      return input.slice(start);
    };
  });

}).call(this);
