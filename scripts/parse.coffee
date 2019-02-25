#sample= ['http://www.facebook.com/','http://www.twitter.com','http://www.live.com','http://www.taobao.com'
module.exports = (robot) ->
  robot.hear /status (.*)/i, (msg) ->
    match = msg.match[1]

    msg.http("#{match}").timeout(2000).get() (err,res,body)->
      if err
        msg.send "the site is down"
      else
        switch res.statusCode
          when 200
            msg.send "the Site's health is good with status 200"
          when 404
            msg.send "the response is 404, not found"
          else
            msg.send "the site is up but there are errors"
            #msg.send "401 error"
      #   when 200
            #msg.send "#{match}: fine"
          #when 404
          #  msg.send "#{match} url is not found"
          #when null
            #msg.send "null response"
          #else
          #  msg.send "null error"
