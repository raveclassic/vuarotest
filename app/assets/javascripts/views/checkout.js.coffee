#= require ./removable-good

class App.CheckoutView extends Marionette.CompositeView
	className: 'checkout-view'
	template: JST['templates/checkout']
	childView: App.RemovableGoodView
	childViewContainer: '.list'

	collectionEvents:
		'add remove reset': 'onCollectionChange'

	ui:
		confirmButton: '.confirm-button'

	events:
		'click @ui.confirmButton': 'onConfirmButtonClick'

	initialize: =>
		@collection = @options.cart

	onChildViewDelete: (childView) =>
		@collection.remove(childView.model)
		@updateConfirmButton()

	onConfirmButtonClick: =>
		alert "(not implemented)\nsmth link $.post('order', ids: @collection.pluck('id'))\n$.post('order', ids: #{JSON.stringify @collection.pluck('id')})"

	onCollectionChange: =>
		@updateConfirmButton()

	updateConfirmButton: =>
		@ui.confirmButton.toggle @collection.length > 0