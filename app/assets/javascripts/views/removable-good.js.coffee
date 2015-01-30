#= require ./good

class App.RemovableGoodView extends App.GoodView
	className: 'good-view removable-good-view'
	template: ->
		original = JST['templates/good'].apply(@, arguments)
		button = '<button type="button" class="btn btn-danger delete-button">Удалить</button>'
		original + button

	ui:
		deleteButton: '.delete-button'

	triggers:
		'click @ui.deleteButton': 'delete'