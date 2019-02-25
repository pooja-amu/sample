import httplib2

h = httplib2.Http()
listUrls = ['http://www.google.com','http://www.xkcd.com','http://somebadurl.com']
count = 0

for each in listUrls:
    try:
        response,content = h.request(listUrls[count])
        if response.status==200:
            print("{0} is : UP".format(listUrls[count]))
    except httplib2.ServerNotFoundError:
        print("{0} is :DOWN".format(listUrls[count]))
    count = count + 1
