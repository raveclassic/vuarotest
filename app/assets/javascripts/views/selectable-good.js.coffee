#= require ./good

class App.SelectableGoodView extends App.GoodView
	className: 'good-view selectable-good-view'
	events:
		'click': 'onClick'

	initialize: =>
		if @options.cart
			id = @model.get('id')
			if @options.cart.any((g) -> g.get('id') is id)
				@$el.addClass 'selected'

	onClick: (e) =>
		isSelected = $(e.currentTarget).toggleClass('selected').hasClass('selected')
		@trigger 'click', isSelected