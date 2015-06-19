'use strict'

###*
 # @ngdoc overview
 # @name yuAmyWeddinggithubioApp
 # @description
 # # yuAmyWeddinggithubioApp
 #
 # Main module of the application.
###
angular
  .module 'yuAmyWeddinggithubioApp', [
    'ngAnimate',
    'ngAria',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngTouch'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

