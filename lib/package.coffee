fs = require 'fs'
path = require 'path'

# Singleton for the contents of package.json
exports.load = ->
  if !@package
    location = path.join(process.cwd(), 'package.json')
    try
      @package = JSON.parse fs.readFileSync(location)
    catch err
      ext = path.extname __filename
      @package = path.basename(__filename).replace ext, ''
    finally
      return @package
  else
    return @package
