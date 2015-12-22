@Tweets = new Mongo.Collection 'tweets'

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn:-> Meteor.subscribe 'tweets'
Router.route '/',
  name: 'CardList'

AccountsTemplates.configure
  negativeValidation: true
  overrideLoginErrors: false
  lowercaseUsername: true
  onSubmitHook: (err) ->
    $ '#account-modal'
      .closeModal() if not err
  showReCaptcha: true
  reCaptcha:
    siteKey: '6LfZoRMTAAAAAKdyhEJ1oamtv7NJZKvEroAjCOs_'
AccountsTemplates.addFields [
    _id: 'username'
    displayName: 'username'
    type: 'text'
    required: true
    re: /[\w_\-\u4e00-\u9fa5]{4,30}/
    errStr: '4-30个字符，支持中英文、数字、下划线、减号'
  ,
  AccountsTemplates.removeField 'password'
]
AccountsTemplates.getField 'email'
  .displayName = '电子邮箱'
AccountsTemplates.getField 'email'
  .errStr = '无效的邮箱地址'
AccountsTemplates.texts.maxAllowedLength = '字数最多为'
AccountsTemplates.texts.minRequiredLength = '字数至少为'
T9n.setLanguage 'zh_cn'
