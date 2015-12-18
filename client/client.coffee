Template.publish.events
  'click #edit-btn':->
    $ '#edit-modal'
    .openModal()
Template.publish.rendered=->
  $ '#edit-btn'
  .tooltip
    delay: 0

Template.CardList.helpers
  tweets:-> Tweets.find()
Template.CardList.rendered=->
  $ '#masonry-list'
  .masonry
    itemSelector: '.card'
    gutter: 10

Template.nav.events
  'click #login-btn':->
    if Meteor.user()
      AccountsTemplates.logout()
    else
      $ '#login-modal'
      .openModal()
  'click #logout-a':->
    Meteor.logout()
Template.nav.rendered=->
  $ '#profile-btn'
  .dropdown
    belowOrigin: true
    hover: true
