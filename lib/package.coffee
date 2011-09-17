fs = require 'fs'
path = require 'path'

# Singleton for the contents of package.json
exports.load = ->
  if !@package
    location = path.join process.cwd(), 'package.json'
    if path.existsSync location
      @package = JSON.parse fs.readFileSync(location)
    else
      appName = path.basename(require.main.filename).replace(path.extname(require.main.filename), '')
      @package = {name: appName}
  return @package
