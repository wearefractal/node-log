fs = require 'fs'
path = require 'path'

# Singleton for the contents of package.json
exports.load = ->
  if !@package
    location = path.join(process.cwd(), 'package.json')
    console.log location
    if path.existsSync location
      @package = JSON.parse fs.readFileSync(location)
    else
      @package = {name: path.basename(__filename).replace(path.extname(__filename), '')}
  return @package
