SurveyWeb.Views.SingleLineQuestions ||= {}

class SurveyWeb.Views.SingleLineQuestions.DummyView extends Backbone.View
  events: {
    'keyup': 'edit'
  }

  initialize: ->
    this.model = new SurveyWeb.Models.SingleLineQuestion
    this.template = _.template($('#single_line_dummy_question_template').html())    
    this.render()

  render: ->
    $(this.el).html(this.template(this.model.toJSON()))
    this.input = $(this.el).find('input')
    return this

  edit: ->
    value = this.input.val()
    this.model.set({content: value})
    this.save()

  save: ->
    this.model.save()