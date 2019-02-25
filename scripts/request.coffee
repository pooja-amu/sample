http = require('http')
sample= ['http://www.bing.com/','http://www.facebook.com/','http://www.twitter.com']
for i in sample
  http.get { host:"#{i}"}, (error,res,body) ->
    if error
      console.log "#{error}"
    else
      console.log res.statusCode
