'use strict'

fs = require 'fs'
path = require 'path'
postcss = require 'postcss'

module.exports = (wintersmith, callback) ->

  class PostCSSPlugin extends wintersmith.ContentPlugin

    constructor: (@_filepath, @_text) ->

    getFilename: ->
      return @_filepath.relative

    getView: ->
      return (env, locals, contents, templates, callback) ->
        try
          options = env.config.postcss or {}
          options.filename = this.getFilename()
          options.paths = [path.dirname(@_filepath.full)]
          options.plugins = options.plugins or []

          plugins = options.plugins.map (p) ->
            plugin = require path.join(process.cwd(), p.path)
            return plugin(p.params) if p.autoexec is true
            return plugin

          postcss(plugins)
            .process(@_text, options)
            .then (result) -> callback null, new Buffer(result.css)
            .catch (error) -> wintersmith.logger.error error.toString()

        catch error
          callback error

  PostCSSPlugin.fromFile = (filepath, callback) ->
    fs.readFile filepath.full, (error, buffer) ->
      if error
        callback error
        return
      callback null, new PostCSSPlugin(filepath, buffer.toString())

  wintersmith.registerContentPlugin 'styles', '**/*.css', PostCSSPlugin
  callback()
