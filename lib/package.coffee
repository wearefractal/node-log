fs = require 'fs'
path = require 'path'

# Singleton for the contents of package.json
exports.load = ->
  if !@package
    location = path.join process.cwd(), 'package.json'
    try {
      @package = JSON.parse fs.readFileSync(location)
    } catch (err) {
      @package = 'Application'
    }
    return @package
  else
    return @package
