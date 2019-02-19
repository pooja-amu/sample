module.exports = (robot) ->
  robot.respond /check/i, (msg) ->
    msg.send "Checking Health"
    robot.http("http://www.google.com//")
      .get() (err, res, body) ->
        if err
          msg.send "Encountered an error :( #{err}"
          return
        if res.statusCode isnt 200
            msg.send "Request didn't come back HTTP 200 :("
            return
        if res.statusCode is 200
            msg.send "I am OK"