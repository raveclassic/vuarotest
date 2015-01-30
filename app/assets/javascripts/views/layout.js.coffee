class App.LayoutView extends Marionette.LayoutView
	className: 'layout-view'
	template: JST['templates/layout']
	regions:
		mainRegion: 'section'

	ui:
		links: 'header .nav li'
		indexLink: '#index-link'
		checkoutLink: '#checkout-link'
		checkoutQuantity: '#checkout-quantity'

	events: =>
		'click @ui.links': (e) => #update 'active' class instantly on click
			@ui.links.removeClass('active')
			$(e.currentTarget).addClass('active')

	collectionEvents:
		'add remove reset': 'onCollectionChange'

	initialize: =>
		#an instance of Good collection shared between subviews
		@collection = new App.GoodCollection()

	onRender: =>
		#check if some data is already stored in localStorage
		@collection.add App.localStorage.get(App.LOCALSTORAGE_ENTRY_NAME)

		#handle view switch requests
		App.commands.setHandler App.commands.WORKSPACE_SHOW, @onWorkspaceShow

	onWorkspaceShow: (viewClass, options = {}) =>
		switch viewClass
			when App.IndexView
				@ui.checkoutLink.removeClass 'active'
				@ui.indexLink.addClass 'active'
			when App.CheckoutView
				@ui.indexLink.removeClass 'active'
				@ui.checkoutLink.addClass 'active'

		options.cart = @collection
		instance = new viewClass options
		@mainRegion.show instance

	onCollectionChange: =>
		@ui.checkoutQuantity.text @collection.length