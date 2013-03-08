requirePaths =
	paths: 
		jquery: 'http://code.jquery.com/jquery-1.7.2.min'
		underscore: "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.3.3/underscore-min"
		backbone: "//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.2/backbone-min"

if jsPaths
	for own key, value of jsPaths
		key = key.substr(4) if key.indexOf('lib/') == 0
		requirePaths.paths[key] = value

require.config
	paths: requirePaths.paths

	shim:
		jquery:
			exports: '$'
		underscore:
			exports: '_'
		backbone:
			deps: ['underscore', 'jquery']
			exports: 'Backbone'

require ['router'], (Router)->
	window.App = new Router()
