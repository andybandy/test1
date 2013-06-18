@SampleApp =
  Templates: {}
  Models: {}
  Views: {}
  Routes: {}


$ ->
  sampleApp = window.SampleApp
  app = new sampleApp.Models.App()
  appView = new sampleApp.Views.AppView({model: app})
  appView.render()
