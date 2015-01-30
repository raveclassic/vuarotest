App.localStorage =
	get: (key) ->
		if localStorage
			try
				JSON.parse localStorage.getItem key

	set: (key, data) ->
		if localStorage
			try
				localStorage.setItem key, JSON.stringify data