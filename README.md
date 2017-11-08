TO ADD BLOCMETRICS TO YOUR SITE WITH JAVASCRIPT:

In your application.js file add:

    var blocmetrics = {};
    
    blocmetrics.report = function(eventName){
      var event = {event: {name: eventName}};
    
      var request = new XMLHttpRequest();
    
      request.open("POST", "https://blocmetrics-smithrunner.c9users.io/api/events", true);
    
      request.setRequestHeader('Content-Type', 'application/json');
    
      request.send(JSON.stringify(event));
    };

Then in your application, the report function can be called to track an event.

Examples:

<a href="/about" onclick="blocmetrics.report('about link clicked')">

or 

<script>blocmetrics.report('about page loaded');</script>