module.exports = (robot) ->
  robot.respond /show calender|cal/i, (res) ->
    res.send "Today date is " + new Date()

    robot.respond /Hi/i, (res) ->
      res.send "Hello ! "

   ok = ['Doing great, Thank you !', 'Good , Wbu .... ?']

   robot.respond /Hru/i, (res) ->
    res.send res.random ok

  
