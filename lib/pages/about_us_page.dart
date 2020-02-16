/*import 'package:flutter/material.dart';

//webview插件（网页插入）
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.baidu.com",
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../model/information.dart';
import '../model/information1.dart';

const httpHeaders = {
  'Connection': 'close',
  'api-key': 'q9fXA7P8YJsqccsr5nsb9qVCbyQ=',
  'Host': 'api.heclouds.com',
};

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double shuju;
  String danwei;
  int shuju1;
  int shuju2;
  int shuju3;
  static String xianshi = '点击';
  static String xianshi1 = '点击';
  static String xianshi2 = '点击';
  static String xianshi3 = '点击';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                  onPressed: () async {
                    Dio dio = new Dio();
                    dio.options.headers = httpHeaders;
                    Response res = await dio.get(
                        'http://api.heclouds.com/devices/581573009/datastreams/Temperature');
                    var regionResp = new RegionResp(res.data);
                    shuju = regionResp.data.current_value;
                    danwei = regionResp.data.unit_symbol;
                    xianshi = shuju.toString() + danwei.toString();
                    if (mounted) {
                      setState(() {
                        print(shuju);
                        print(danwei);
                        print(xianshi);
                      });
                    }
                  },
                  child: Text("温度"),
                  color: Colors.greenAccent),
              RaisedButton(
                  onPressed: () async {
                    Dio dio = new Dio();
                    dio.options.headers = httpHeaders;
                    Response res = await dio.get(
                        'http://api.heclouds.com/devices/581573009/datastreams/Humidity');
                    var regionResp1 = new RegionResp1(res.data);
                    shuju1 = regionResp1.data.current_value1;
                    danwei = regionResp1.data.unit_symbol;
                    xianshi1 = shuju1.toString() + danwei.toString();
                    if (mounted) {
                      setState(() {
                        print(shuju1);
                        print(danwei);
                        print(xianshi1);
                      });
                    }
                  },
                  child: Text("湿度"),
                  color: Colors.greenAccent),
              RaisedButton(
                  onPressed: () async {
                    Dio dio = new Dio();
                    dio.options.headers = httpHeaders;
                    Response res = await dio.get(
                        'http://api.heclouds.com/devices/581573009/datastreams/PM25');
                    var regionResp2 = new RegionResp1(res.data);
                    shuju2 = regionResp2.data.current_value1;
                    danwei = regionResp2.data.unit_symbol;
                    xianshi2 = shuju2.toString() + danwei.toString();
                    if (mounted) {
                      setState(() {
                        print(shuju2);
                        print(danwei);
                        print(xianshi2);
                      });
                    }
                  },
                  child: Text("PM2.5"),
                  color: Colors.greenAccent),
              RaisedButton(
                  onPressed: () async {
                    Dio dio = new Dio();
                    dio.options.headers = httpHeaders;
                    Response res = await dio.get(
                        'http://api.heclouds.com/devices/581573009/datastreams/Gas');
                    var regionResp3 = new RegionResp1(res.data);
                    shuju3 = regionResp3.data.current_value1;
                    danwei = regionResp3.data.unit_symbol;
                    xianshi3 = shuju3.toString() + danwei.toString();
                    if (mounted) {
                      setState(() {
                        print(shuju3);
                        print(danwei);
                        print(xianshi3);
                      });
                    }
                  },
                  child: Text("有害气体"),
                  color: Colors.greenAccent),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    xianshi,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    xianshi1,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    xianshi2,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    xianshi3,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

      /*
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(xianshi),
          RaisedButton(
              onPressed: () async {
                Dio dio = new Dio();
                dio.options.headers = httpHeaders;
                Response res = await dio.get(
                    'http://api.heclouds.com/devices/581573009/datastreams/Temperature');
                var regionResp = new RegionResp(res.data);
                shuju = regionResp.data.current_value;
                danwei = regionResp.data.unit_symbol;
                xianshi = shuju.toString() + danwei.toString();
                setState(() {
                  print(shuju);
                  print(danwei);
                  print(xianshi);
                });
              },
              child: Text("温度"),
              color: Colors.greenAccent),
          RaisedButton(
              onPressed: () async {
                Dio dio = new Dio();
                dio.options.headers = httpHeaders;
                Response res = await dio.get(
                    'http://api.heclouds.com/devices/581573009/datastreams/Humidity');
                var regionResp1 = new RegionResp1(res.data);
                shuju1 = regionResp1.data.current_value1;
                danwei = regionResp1.data.unit_symbol;
                xianshi = shuju1.toString() + danwei.toString();
                setState(() {
                  print(shuju1);
                  print(danwei);
                  print(xianshi);
                });
              },
              child: Text("湿度"),
              color: Colors.greenAccent),
          RaisedButton(
              onPressed: () async {
                Dio dio = new Dio();
                dio.options.headers = httpHeaders;
                Response res = await dio.get(
                    'http://api.heclouds.com/devices/581573009/datastreams/PM25');
                var regionResp2 = new RegionResp1(res.data);
                shuju2 = regionResp2.data.current_value1;
                danwei = regionResp2.data.unit_symbol;
                xianshi = shuju2.toString() + danwei.toString();
                setState(() {
                  print(shuju2);
                  print(danwei);
                  print(xianshi);
                });
              },

              child: Text("PM2.5"),
              color: Colors.greenAccent),
          RaisedButton(
              onPressed: () async {
                Dio dio = new Dio();
                dio.options.headers = httpHeaders;
                Response res = await dio.get(
                    'http://api.heclouds.com/devices/581573009/datastreams/Gas');
                var regionResp3 = new RegionResp1(res.data);
                shuju3 = regionResp3.data.current_value1;
                danwei = regionResp3.data.unit_symbol;
                xianshi = shuju3.toString() + danwei.toString();
                setState(() {
                  print(shuju3);
                  print(danwei);
                  print(xianshi);
                });
              },

              child: Text("有害气体"),
              color: Colors.greenAccent),
        ],

      ),
      */
    );
  }
}

/*
  Future getHttp() async {
    try {
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      Response res = await dio.get(
          "http://api.heclouds.com/devices/581573009/datastreams/Temperature");
      var regionResp = new RegionResp(res.data);
      shuju = regionResp.data.current_value;
      return regionResp;
    } catch (e) {
      return print(e);
    }
  }
  void httpkey() {
    print('开始向onenet请求数据..................');
    setState(() {
      print(shuju);
    });
  }
}
*/
