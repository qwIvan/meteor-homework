Template.publish.events
  'click #edit-btn':->
    $ '#edit-modal'
    .openModal()

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
Template.nav.helpers
  btnText:->
    if Meteor.user() then '注销' else '登录'