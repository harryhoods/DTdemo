- git clone/pull DTdemo repository

STARTING THE SERVER
--------------------
- Install nodejs v0.10.26 from http://nodejs.org/download/
- Start the server 
    - node <git clone path>/server/app.js for example, node /Volumes/BI/DTdemo/server/app.js
- Hit the end point 
    - http://localhost:3001/?id=London to get response [{"location": { "name" : "Bexley/Slade-Green PM10:18.4", "color" : "green", "lat" : 51.46599, "long" : 0.18484879 }}]
- API response values can be updated in; server/routes/index.js
- These responses will be automatically reflected in the App

EDITING THE APP
---------------
- Install xCode (mac)
- Open Demo/Demo.xcodeproj, it automatically opens in xCode
- ViewController.m is the initial table view
- MapViewController.m is the second screen, Map view.
- Main.storyboard has these two screens and added static elements.
