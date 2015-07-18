class window.AppView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html new GameModelView(model: new GameModel()).el

  events:
    'click .retry-button': -> @render()
