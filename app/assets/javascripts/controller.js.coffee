class App.Controller extends Marionette.Controller
	index: ->
		App.commands.execute App.commands.WORKSPACE_SHOW, App.IndexView
	checkout: ->
		App.commands.execute App.commands.WORKSPACE_SHOW, App.CheckoutView