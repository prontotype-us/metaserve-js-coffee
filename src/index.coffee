fs = require 'fs'
coffee = require 'coffee-script'
Compiler = require 'metaserve/lib/compiler'

class CoffeeScriptCompiler extends Compiler

    default_options:
        ext: 'coffee'
        coffee_options:
            bare: true

    compile: (coffee_filename, cb) ->
        options = @options
        file_str = fs.readFileSync(coffee_filename).toString()

        cb null, {
            content_type: 'text/javascript'
            source: file_str
            compiled: coffee.compile(file_str, options.coffee_options)
        }

module.exports = (options={}) -> new CoffeeScriptCompiler(options)

# TODO: Minification option
# uglify = require 'uglify-js'
# uglify.minify(compiled_str, {fromString: true}).code

