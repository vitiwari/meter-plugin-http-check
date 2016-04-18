TrueSight Pulse HTTP(S) Check Plugin
------------------------------------

Polls a set of URLs and reports on the response time.The plugin allows multiple URLs to be polled and each of those URLs to set their own Poll interval. The URLs can require authentication, the plugin supports basic HTTP authentication.



### Measurement Behavior

The HTTP check plugin permits specification of an expected response code from an end point. The table below summarizes the measurement behavior depending on the expected response code.

The HTTP plugin has an option to generate an error event if the return HTTP response does not meet the expected value.

|Expected Response |Allow Direct|Max Redirect|Measurement|Usage|
|:----------------:|:----------:|:----------:|:---------|:---|
|2XX|False|Any|Returns response time from request if response is 2XX otherwise returns a measurement value of -1 .|Measurement of 2XX response|
|2XX|True | Any| Redirects up to _Max Redirect_. if response is other than 2XX returns a measurement value of -1 and optionally raises an error event.|Measurement of 2XX response|
|3XX| False | Any| Returns response time from request if response is 3XX otherwise returns a measurement value of -1 .|Measures 3XX response time|
|3XX|True|Any| Redirects up to _Max Redirect_. if response is other than 3XX returns a measurement value of -1 and raises an error event.|Checks that there are at least _Max Redirect_ redirects|
|4XX| False | Any|Returns response time from request if response is 4XX otherwise returns a measurement value of -1 .|Measurement of 4XX response |
|4XX| True | Any|Redirects up to _Max Redirect_. if response is other than 4XX returns a measurement value of -1 and raises an error event.|Checks and endpoint for 4XX response code |
|5XX| False | Any|Returns response time from request if response is 5XX otherwise returns a measurement value of -1 .|Measurement of 5XX response |
|5XX| True | Any|Redirects up to Max Redirect. if response is other than 5XX returns a measurement value of -1 and raises an error event.|Checks and endpoint for 5XX response code|

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

### Boundary Meter versions v4.2 or later

- To install new meter go to Settings->Installation or [see instructions](https://help.boundary.com/hc/en-us/sections/200634331-Installation).
- To upgrade the meter to the latest version - [see instructions](https://help.boundary.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter).

### Plugin Setup

None

#### Plugin Configuration Fields

|Field Name         |Description                                                                                                           |
|:------------------|:---------------------------------------------------------------------------------------------------------------------|
|Source             |The source to display in the legend for the endpoint. Ex. www.google.com                                              |
|Poll Time (sec)    |The Poll Interval to call your endpoint in seconds. Default is 5 seconds.                                                             |
|Method             |The Method of the endpoint. One of the following: _DELETE_, _GET_, _POST_, or _PUT_.                                                                                           |
|Protocol           |The protocol of the endpoint. Either _http_ or _https_.                                                                                           |
|URL                |The host and path name. For example, www.yahoo.com or www.yahoo.com:8080/some-random-page                            |
|Expected Response|Expected response from the endpoint one of the following values: 2XX, 3XX, 4XX, or 5XX                                     |
|Debug Level | If you are having issues with the plugin, you can enable additional debugging output to be shown in the Meter console.|
|Username           |(optional) The username required to access the endpoint                                                               |
|Password           |(optional) The password required to access the endpoint                                                               |
|POST data          |(optional) Additional information to pass along to the endpoint. Key Values pairs, "key=value" one per line           |

### Metrics Collected

|Metric Name       |Description               |
|:-----------------|:-------------------------|
|HTTP Response Time|The Response time of a URL|

### Dashboards

|Dashboard Name|Metrics Displayed       |
|:-------------|:-----------------------|
|HTTP Check    |HTTP Response Time|

### References

None
