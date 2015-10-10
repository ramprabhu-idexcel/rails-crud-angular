//creating a module for visitor center
var visitorCenter = angular.module('VisitorCenter', ['ngResource']);

// Adding factory for visitor
visitorCenter.factory("Visitor", function($resource) {
    return $resource("visitors/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' },
        delete: { method: 'DELETE', params: {id: '@id'},responseType: 'json' }
    });
});


visitorCenter.factory('Visitors', function($resource){
    return $resource('/visitors.json', {},{
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
});


//making controller for visitor - create,update and delete
visitorCenter.controller("visitorsController", function($scope, Visitor, Visitors) {
    $scope.visitors = Visitor.index();

    $scope.addVisitor = function() {

           if (angular.isUndefined($scope.newVisitor) || angular.isUndefined($scope.newVisitor.id) || $scope.newVisitor.id === null) {

                //visitor = Visitor.save($scope.newVisitor);
                //$scope.visitors.push(visitor);
                //$scope.newVisitor = {};
               Visitors.create({visitor: $scope.newVisitor}, function(result){

                  if(angular.isUndefined(result.visitor_errors)) {
                      $scope.visitors.push(result);
                      $scope.newVisitor = {};
                      alert("Visitor has been created successfully");
                  }
                  else{
                      alert(result.visitor_errors);
                  }
               });

            }
            else {
                Visitor.update({id: $scope.newVisitor.id}, {visitor: $scope.newVisitor}, function () {
                    $scope.newVisitor = {};
                });
            }


    };

    $scope.deleteVisitor = function (index) {
        if (confirm("Are you sure you want to delete this visitor?")){
            visitor = $scope.visitors[index];
            Visitor.delete(visitor);
            $scope.visitors.splice(index, 1);
        }
    };

    $scope.editVisitor = function(index) {
        $scope.newVisitor = $scope.visitors[index];

    }

});





