TrueSight Pulse HTTP(S) Check Plugin
------------------------------------

Polls a set of URLs and reports on the response time.The plugin allows multiple URLs to be polled and each of those URLs to set their own Poll interval. The URLs can require authentication, the plugin supports basic HTTP authentication.


### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

### TrueSight Pulse Meter versions v4.2 or later

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
|URL                |The host and path name. For example, www.yahoo.com or www.yahoo.com:8080/some-random-page                             |
|Debug Level | If you are having issues with the plugin, you can enable additional debugging output to be shown in the Meter console.|
|Follow Redirects |Follow redirections on 3xx responses|
|Max Redirects           |Max redirections allowed                                                               |
|Username           |(optional) The username required to access the endpoint                                                               |
|Password           |(optional) The password required to access the endpoint                                                               |
|POST data          |(optional) Additional information to pass along to the endpoint. Key Values pairs, "key=value" one per line           |
|Ignore Status Code |Ignoring for response status code           |

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
