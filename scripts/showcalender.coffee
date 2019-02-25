module.exports = (robot) ->
  robot.respond /show calender|cal/i, (res) ->
    res.send "Today date is " + new Date()

    robot.respond /Namaste/i, (res) ->
      res.send "Welcome to india ! "

   okay = ['Doing great, Thank you !', 'Good , Wbu .... ?']

   robot.respond /Hru/i, (res) ->
    res.send res.random okay
