Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn:->
    Meteor.subscribe('tweets')

Router.route '/','CardList'