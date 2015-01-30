class App.Router extends Marionette.AppRouter
	onRoute: ->
		console.debug 'ROUTER: ', arguments

	appRoutes:
		'(/)': 'index'
		'checkout(/)': 'checkout'