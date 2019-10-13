{spawn} = require 'child_process'

# Run a command, like Rake's sh.
#
# Passes args to spawn, and accepts a single string as shorthand
#
#   sh 'coffee', '--version'
#   sh 'coffee --version'
#
sh = (command, args...) ->
  if args.length is 0
    [command, args...] = command.split ' '
  process = spawn command, args, stdio: 'inherit'
  process.on 'close', (code) =>
    console.log "`#{command} #{args.join ' '}`: #{if code is 0 then '✓' else 'x'}"

task 'build', 'Build project from coffeescript -> js', ->
  sh 'yarn run coffee --compile src/'

task 'start', 'start expo app', ->
  invoke 'build'
  sh 'yarn run expo start'

task 'android', 'start expo android app', ->
  invoke 'build'
  sh 'yarn run expo start --android'

task 'ios', 'start expo ios app', ->
  invoke 'build'
  sh 'yarn run expo start --ios'

task 'web', 'start expo web app', ->
  invoke 'build'
  sh 'yarn run expo start --web'

task 'eject', 'ejects this app from expo', ->
  sh 'yarn run expo eject'

task 'publish', 'publishes this app to expo', ->
  sh 'yarn run expo publish'

task 'test', 'run jest tests', ->
  invoke 'build'
  sh "yarn run jest #{if process.env.CI then '' else '--watchAll'}"
