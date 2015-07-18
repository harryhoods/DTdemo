- git clone/pull DTdemo repository

- Install nodejs v0.10.26 from http://nodejs.org/download/

- Start the server 
    - node <git clone path>/server/app.js for example, node /Volumes/BI/DTdemo/server/app.js

- Hit the end point by providing an id
    - http://localhost:3001/?id=London to get response [{"location": { "name" : "Bexley/Slade-Green PM10:18.4", "color" : "green", "lat" : 51.46599, "long" : 0.18484879 }}]
