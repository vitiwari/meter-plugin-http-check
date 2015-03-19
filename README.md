Boundary HTTP Check Plugin
---------------------------------
Polls a set of URLs and reports on the response time. The plugin allows multiple URLs to be polled and each of those URLs to set their own Poll interval. The URLs can require authentication, the plugin supports basic HTTP authentication.

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

#### For Boundary Meter V4.0
(to update/download - curl -fsS -d '{"token":"api.<Your API Key Here>"}' -H 'Content-Type: application/json' https://meter.boundary.com/setup_meter > setup_meter.sh && chmod +x setup_meter.sh && ./setup_meter.sh)

|  Runtime | node.js | Python | Java |
|:---------|:-------:|:------:|:----:|
| Required |         |        |      |

#### For Boundary Meter less than V4.0

|  Runtime | node.js | Python | Java | LUA |
|:---------|:-------:|:------:|:----:|:---:|
| Required |    +    |        |      |  +  |

- [How to install node.js?](https://help.boundary.com/hc/articles/202360701)

### Plugin Setup
None

#### Plugin Configuration Fields
|Field Name         |Description                                                                       |
|:------------------|:---------------------------------------------------------------------------------|
|Source             |The source to display in the legend for the endpoint. Ex. www.google.com          |
|Poll Time (sec)    |The Poll Interval to call your endpoint in seconds. Ex. 5                         |
|Method             |The Method of the endpoint                                                        |
|Protocol           |The protocol of the endpoint                                                      |
|URL                |The URL of the endpoint. For example, www.yahoo.com or www.yahoo.com:8080/some-random-page  |
|Ignore Status Code |If any response from the server is considered valid, even an error, enable this.  |
|Enable Debug Output|If you are having issues with the plugin, you can enable additional debugging output to be shown in the Meter console |
|Username           |(optional) The username required to access the endpoint                           |
|Password           |(optional) The password required to access the endpoint                           |
|POST data          |(optional) Additional information to pass along to the endpoint. Key Values pairs, "key=value" one per line |

### Metrics Collected
|Metric Name       |Description               |
|:-----------------|:-------------------------|
|HTTP Response Time|The Response time of a URL|
