@Tweets = new Mongo.Collection 'tweets'

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn:->
    Meteor.subscribe 'tweets'
Router.route '/',
  name: 'CardList'

AccountsTemplates.configure
  overrideLoginErrors: false
  sendVerificationEmail: true
  onSubmitHook: (err) ->
    $ '#login-modal'
    .closeModal() if not err
T9n.setLanguage 'zh_cn'