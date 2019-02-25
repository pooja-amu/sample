module.exports = (robot) ->
  robot.hear /status/i, (msg) ->
    # console.log(msg)
    @exec = require('child_process').exec
    cmd = "python C:\\Users\\pbuddaraju\\bot\\scripts\\test.py"
    msg.send "Running the checks for status..."

    @exec cmd, (error, stdout, stderr) ->
      if error
        msg.send error
        msg.send stderr
      else
        msg.send stdout
