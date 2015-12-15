Meteor.publish 'tweets',->
  Tweets.find()