Template.publish.events
  'click #edit-btn.modal-open':->
    $ '#edit-modal'
      .closeModal()
    $ '.lean-overlay'
      .remove()
    Session.set 'modalOpen',false
  'click #edit-btn.modal-close':->
    Session.set 'modalOpen',true
    $ '#edit-modal'
      .openModal
        complete:-> Session.set 'modalOpen',false
        ready:->
          $ '#publish-area'
            .focus()
  'click #edit-btn':->
    $ '#edit-btn'
      .mouseleave()
    $ '#edit-btn'
      .mouseenter()
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
    $ '#login-modal'
      .openModal
        ready:->
          $ '#at-field-username_and_email'
            .focus()
  'click #logout-a':-> Meteor.logout()
Template.nav.rendered=->
  $ '#profile-btn'
    .dropdown
      belowOrigin: true
      hover: true
Template.reCaptchaFix.replaces 'atReCaptcha'