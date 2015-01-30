class App.GoodModel extends Backbone.Model
	url: 'good'
	defaults:
		name: ''
		description: ''
		image: ''
		price: 0

class App.GoodCollection extends Backbone.Collection
	url: 'good'
	model: App.GoodModel