Meteor.publish 'tweets',-> Tweets.find()

AccountsTemplates.configure
  reCaptcha:
    secretKey: '6LfZoRMTAAAAACcZdbRN85cN3CEioSOHlT1HsrPN'
