class SampleApp.Views.AppView extends Backbone.View
  el: '.sample_area'

  render: () ->
    $(@el).html("<h1>#{@model.toJSON().type}</h1>")
    return this
