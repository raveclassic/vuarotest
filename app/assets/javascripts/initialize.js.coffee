$('html').on 'click', 'a:not([data-bypass])', (e) -> e.preventDefault()
$('html').on 'click', 'a[href]:not([href=#])', (e) ->
	App.router.navigate $(e.currentTarget).attr('href'), trigger: true

faker.locale = 'ru'

Marionette.CollectionView::childViewEventPrefix = 'ChildView'