Boundary Apache HTTP Check Plugin
---------------------------------
Polls a set of URLs and reports on the response time. The plugin allows multiple URLs to be polled and each of those URLs to set their own Poll interval.  The URLs can require authentication, the plugin supports basic authentication.

### Platforms
- Windows
- Linux
- OS X
- SmartOS

### Prerequisites
- node version 0.8.0 or later

### Plugin Setup
None

### Plugin Configuration Fields
|Field Name         |Description                                                                                                          |
|:------------------|:--------------------------------------------------------------------------------------------------------------------|
|Source             |The source to display in the legend for the endpoint. Ex. www.google.com                                             |
|Poll Time (sec)    |The Poll Interval to call your endpoint in seconds. Ex. 5                                                            |
|Method             |The Method of the endpoint                                                                                           |
|Protocol           |The protocol of the endpoint                                                                                         |
|URL                |The URL of the endpoint.  For example, www.graphdat.com or www.graphdat.com:8080/some-random-page                    |
|Ignore Status Code |If any response from the server is considered valid, even an error, enable this.                                     |
|Enable Debug Output|If you are having issues with the plugin, you can enable additional debugging output to be shown in the relay console|
|Username           |(optional) The username required to access the endpoint                                                              |
|Password           |(optional) The password required to access the endpoint                                                              |
|POST data          |(optional) Additional information to pass along to the endpoint. Key Values pairs, "key=value" one per line          |

### Metrics Collected
|Metric Name       |Description               |
|:-----------------|:-------------------------|
|HTTP Response Time|The Response time of a URL|


