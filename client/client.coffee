Template.publish.events
  'click #edit-btn':-> $('#edit-modal').openModal()

Template.CardList.helpers
  tweets:-> Tweets.find()
Template.CardList.rendered=->
  $('#masonry-list').masonry
    itemSelector: '.card'
    gutter: 10

Template.nav.events
  'click #login-btn':->  $('#login-modal').openModal()

Accounts.ui.config
  passwordSignupFields: 'USERNAME_ONLY'
T9n.setLanguage 'zh_cn'