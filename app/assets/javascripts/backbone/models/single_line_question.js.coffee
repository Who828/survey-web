class SurveyWeb.Models.SingleLineQuestion extends Backbone.Model
  urlRoot:  '/single_line_questions'

  initialize: ->
    that = this
    this.save()

  defaults: {
    content: "Untitled"        
  }
