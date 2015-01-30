#= require ./selectable-good

class App.IndexView extends Marionette.CompositeView
	className: 'index-view'
	template: JST['templates/index']
	childView: App.SelectableGoodView
	childViewContainer: '.list'

	initialize: =>
		@collection = new App.GoodCollection()
		@cart = @options.cart
#		goods = for i in [1..20]
#			good = new App.GoodModel
#				id: _.uniqueId()
#				name: faker.lorem.words()
#				description: faker.lorem.sentence()
#				image: faker.image.image()
		@collection.add App.GOOD_FIXTURES

	childViewOptions: =>
		cart: @cart

	onChildViewClick: (itemView, isSelected) =>
		if isSelected
			@cart.add itemView.model
		else
			@cart.remove itemView.model
		App.localStorage.set(App.LOCALSTORAGE_ENTRY_NAME, @cart.toJSON())