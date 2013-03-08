define ['jquery', 'underscore', 'backbone', 'text!/html/test.html'], ($, _, Backbone, testTemplate)->
	class Router extends Backbone.Router
		initialize: ->
			$('body').append(_.template(testTemplate))
