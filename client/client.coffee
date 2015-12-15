Template.publish.events
  'click #edit-btn':-> $('#edit-modal').openModal()

Template.CardList.helpers
  tweets:-> Tweets.find()
Template.CardList.rendered=->
  $('#masonry-list').masonry
    itemSelector: '.card'
    gutter: 10