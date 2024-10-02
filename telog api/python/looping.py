
information = [
    {"site": "Office",
     "inlet": "67",
     "outlet": "69"},
    {"site": "Miller Heights",
     "inlet": "10",
     "outlet": "12"},
    {"site": "Walnut Ln",
     "inlet": "24",
     "outlet": "20"}
]

def urlGenerator():
    for x in information:
        site = x["site"]
        inlet = x["inlet"]
        outlet = x["outlet"]
        inletURL = "https://api.telogdhs.net/api/measurements/{}/data?last=14400".format(str(inlet))
        outletURL = "https://api.telogdhs.net/api/measurements/{}/data?last=14400".format(str(outlet))
        
        print(inletURL)
        print(outletURL)

urlGenerator()