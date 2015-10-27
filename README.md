TrueSight Pulse HTTP(S) Check Plugin
------------------------------------

Polls a set of URLs and reports on the response time.The plugin allows multiple URLs to be polled and each of those URLs to set their own Poll interval. The URLs can require authentication, the plugin supports basic HTTP authentication.



## Measurement Behavior

The following table provides the behaviour of measurement values for all HTTP response codes

|HTTP Response|Method|Ignore Status Code |Allow Direct|Max Redirect|Behavior|Usage|
|:----------:|:----------:|:------:|:----:|:---:|
|2XX| DELETE,GET,POST,PUT|Any| Any | Any| Returns response time from request.|Measurement of 2XX response|
|3XX| DELETE,GET,POST,PUT|False| True | Any| Performs up to _Max Redirect_ redirects and returns response time from initial request to 3XX redirect(s) if HTTP response code is 2XX, otherwise measurement is -1 and an error event is raised|Validate that redirects are working correctly|
|3XX| DELETE,GET,POST,PUT|False| False | Any| Returns a measurement of -1 and an error event is raised|Checks and endpoint for 3XX response code|
|3XX|DELETE,GET,POST,PUT|True| True | Any| Performs up to _Max Redirect_ redirects and returns response time from initial request to 3XX redirect(s)|Validates the endpoint redirects up to _Max Redirect_|
|3XX|DELETE,GET,POST,PUT|True| False | Any|Returns response time regardless of the return HTTP code status|Measurement of the response time of the endpoint for any HTTP status code|
|4XX|DELETE,GET,POST,PUT|True| Any | Any|Returns response time from request. |Measurement of 4XX response |
|4XX|DELETE,GET,POST,PUT|False| Any | Any|Returns a measurement of -1 and an error event is raised|Checks and endpoint for 4XX response code|
|5XX|DELETE,GET,POST,PUT|True| Any | Any|Returns response time from request. |Measurement of 5XX response |
|5XX|DELETE,GET,POST,PUT|False| Any | Any|Returns a measurement of -1 and an error event is raised|Checks and endpoint for 5XX response code|

# Example
|Method|Expected Response |Allow Direct|Max Redirect|Measurement|Usage|
|:----------:|:------:|:----:|:---:|
| DELETE,GET,POST,PUT|2XX| False | Any| Returns response time from request if response is 2XX otherwise returns a measurement value of -1 .|Measurement of 2XX response|
| DELETE,GET,POST,PUT|2XX|True | Any| Redirects up to _Max Redirect_. if response is other than 2XX returns a measurement value of -1 and raises an error event.|Measurement of 2XX response|
| DELETE,GET,POST,PUT|3XX|True|Any| Redirects up to _Max Redirect_. if response is other than 3XX returns a measurement value of -1 and raises an error event.|Checks that there are at least _Max Redirect_ redirects|
| DELETE,GET,POST,PUT|3XX| False | Any| Returns response time from request if response is 3XX otherwise returns a measurement value of -1 .|Measures 3XX response time|
|DELETE,GET,POST,PUT|4XX| False | Any|Returns response time from request if response is 4XX otherwise returns a measurement value of -1 .|Measurement of 4XX response |
|DELETE,GET,POST,PUT|4XX| True | Any|Redirects up to _Max Redirect_. if response is other than 4XX returns a measurement value of -1 and raises an error event.|Checks and endpoint for 4XX response code |
|DELETE,GET,POST,PUT|5XX| Any | Any|Returns response time from request if response is 5XX otherwise returns a measurement value of -1 .|Measurement of 5XX response |
|DELETE,GET,POST,PUT|5XX| Any | Any|Redirects up to Max Redirect. if response is other than 5XX returns a measurement value of -1 and raises an error event.|Checks and endpoint for 5XX response code|
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
|Poll Time (sec)    |The Poll Interval to call your endpoint in seconds. Ex. 5                                                             |
|Method             |The Method of the endpoint                                                                                            |
|Protocol           |The protocol of the endpoint                                                                                          |
|URL                |The URL of the endpoint. For example, www.yahoo.com or www.yahoo.com:8080/some-random-page                            |
|Ignore Status Code |If any response from the server is considered valid, even an error, enable this.                                      |
|Debug Level | If you are having issues with the plugin, you can enable additional debugging output to be shown in the Meter console |
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
