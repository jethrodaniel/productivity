{exec} = require 'child_process'

run = (sh_string) ->
  exec sh_string, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'build', 'Build project from coffeescript -> js', ->
  run 'yarn run coffee --compile src/'
