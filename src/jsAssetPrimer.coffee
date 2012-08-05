fs = require "fs"

loadFiles = (assetJS) ->
  loadJSFile = (file) ->
    stat = fs.statSync file
    if stat?.isDirectory()
      loadJSDir file
    else
      assetName = (((file.replace "assets/js", "").replace ".coffee", "").replace ".js", "").slice 1
      console.log "Assetizing #{assetName}"
      assetJS assetName
  loadJSDir = (dirPath) ->
    files = fs.readdirSync dirPath
  
    loadJSFile "#{dirPath}/#{file}" for file in files
    true

  loadJSFile "assets/js"

module.exports = 
  init: (assetJS) ->
    loadFiles assetJS