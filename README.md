TrueSight Pulse HTTP(S) Check Plugin
------------------------------------

Polls a set of URLs and reports on the response time.The plugin allows multiple URLs to be polled and each of those URLs to set their own Poll interval. The URLs can require authentication, the plugin supports basic HTTP authentication.



## Redirect Behaviour

The following table provides the behaviour of measurement values 

|Method|Ignore Status Code |Allow Direct|Max Redirect|Behavior|Usage|
|:----------:|:----------:|:------:|:----:|:---:|
| DELETE,GET,POST,PUT|False| True | Any| Performs up to _Max Redirect_ redirects and returns response time from initial request to 3XX redirect(s) if HTTP response code is 2XX, otherwise measurement is -1 and an error event is raised|Validate that redirects are working correctly|
| DELETE,GET,POST,PUT|False| False | Any| Returns response time measurement if HTTP response code is 2XX, otherwise measurement is -1 and an error event is raised|Validating that endpoint returns a success ful HTTP(s) status code 2XX|
|DELETE,GET,POST,PUT|True| True | Any| Performs up to _Max Redirect_ redirects and returns response time from initial request to 3XX redirect(s)|Validates the endpoint redirects up to _Max Redirect_|
|DELETE,GET,POST,PUT|True| False | Any|Returns response time regardless of the return HTTP code status|Measurement of the response time of the endpoint for any HTTP status code|


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
