define ['jquery', 'underscore', 'backbone'], ($, _, Backbone)->
	class Application #extends Backbone.Router
		initialize: ->
			$('body').append('<h3>Hello world!</h3>')
