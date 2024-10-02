import json

idValues = [106, 108]
siteId = 10

def urlGeneration():
	urls = []
	for x in idValues:
		url = "https://api.telogdhs.net/api/measurements/{}/data?siteid={}&last=14400".format(str(x), str(siteId))
		urls.append(url)
	return urls

bothURLs = urlGeneration()
inputURL = bothURLs[0]
outputURL = bothURLs[1]


#set username and password
postBody = {
    "tenant": "tenant27032025",
    "username": "ignitionapi",
    "password": "Fortune3^"
}

postURL = "https://us.trimbleunity.com/unity/tokens"

#apply username and password to postURL
apiToken = "Bearer " + system.net.httpPost(postURL, postData = postBody, contentType = "application/json")

url = "https://api.telogdhs.net/api/measurements/106/data?siteid=10&last=14400"

#get request with all the information
inputGet = system.net.httpGet(inputURL , headerValues={'Authorization': apiToken})
outputGet = system.net.httpGet(outputURL , headerValues={'Authorization': apiToken})

#print(apiGet)

inputData = json.loads(inputGet)
outputData = json.loads(outputGet)

newestInput = inputData[-1]
newestOutput = outputData[-1]

inletPSI = newestInput['avg']
print(inletPSI)

outletPSI = newestOutput['avg']
print(outletPSI)