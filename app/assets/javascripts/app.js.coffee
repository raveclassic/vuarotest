class Application extends Marionette.Application
	LOCALSTORAGE_ENTRY_NAME: 'CART'

	onStart: ->
		@router = new App.Router
			controller: new App.Controller()

		App.workspace.show new App.LayoutView()

		Backbone.history.start
			pushState: true

window.App = new Application()

App.addRegions
	workspace: 'body'

App.commands = new Backbone.Wreqr.Commands()
App.commands.WORKSPACE_SHOW = 1

$ ->
	console.debug 'APP: STARTING'
	App.start()
	console.debug 'APP: STARTED'