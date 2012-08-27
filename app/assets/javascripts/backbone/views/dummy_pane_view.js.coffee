class SurveyWeb.Views.DummyPane extends Backbone.View
  initialize: ->
    this.el = $('#dummy_form_display')
    this.questions = []

  add_new_question: ->
    this.questions.push(new SurveyWeb.Views.SingleLineQuestions.DummyView)
    this.render()

  render: ->
    $(this.el).html('')
    $(this.el).append(question.render().el) for question in this.questions
    return this

  save: ->
    question.save() for question in this.questions