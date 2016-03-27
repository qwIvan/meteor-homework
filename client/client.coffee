Template.publish.events
  'click #pub':->
    $ '#edit-modal'
      .submit()
  'submit #edit-modal':->
    Tweets.insert
      content:
        $ '#publish-area'
        .val()
      author: Meteor.user().username
      createdAt: new Date()
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
  tweets:-> Tweets.find {},
    sort:
      createdAt: -1

Template.CardList.rendered=->
  $ '#masonry-list'
    .masonry
      itemSelector: '.card'
      gutter: 10
      isFitWidth: true

Template.nav.helpers
  avatarUrl:(size)-> Gravatar.imageUrl Meteor.user().emails[0].address,
    default: 'monsterid'
    size: size
Template.nav.events
  'click #reg-btn':->
    AccountsTemplates.setState 'signUp'
    $ '#account-modal'
      .openModal
        ready:->
          $ '#at-field-email'
            .focus()
  'click #login-btn':->
    AccountsTemplates.setState 'signIn'
    $ '#account-modal'
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