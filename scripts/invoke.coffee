{spawn, exec}  = require 'child_process'
module.exports = (robot) ->

 # Deploy to staging
 robot.respond /invoke (.*)/i, (msg) ->
    send = (text, prefix='') ->
        msg.send prefix+text

    # Get subcommand
    subcommand = msg.match[1]
    # Tell the user hubot is working on the request
    msg.send "Preparing to invoke now..."
    # Execute a pyinvoke command
    command = "python #{subcommand}"

    invoke = exec command  , (err, stdout, stderr) ->


      invoke.stderr.on 'data', (data) ->
          for line in data.toString().split('\n')
              send line, 'Error: '

      invoke.stdout.on 'data', (data) ->
          for line in data.toString().split('\n')
              send line

      invoke.on 'exit', (code) ->
          if code == 0
              send "Done #{command}."
          else
              send "FAILED #{command}. Returned #{code}"
