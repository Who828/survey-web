class SurveyWeb.Models.SingleLineQuestion extends Backbone.Model
  initialize: ->
    this.urlRoot = window.location.pathname.replace('/build', '') + '/single_line_questions'
    this.save()

  defaults: {
    content: "Untitled"        
  }
