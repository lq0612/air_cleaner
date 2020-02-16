import 'package:flutter/material.dart';

//启动界面导入
import 'package:air_cleaner/loading.dart';
import 'package:air_cleaner/app.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:air_cleaner/log_in.dart';

void main() => runApp(MaterialApp(
      //取消测试debug图标
      debugShowCheckedModeBanner: false,
      //安卓后台名字
      title: '空气净化器',
      theme: mDefaultTheme,
      //添加路由
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => App(),
        "login": (BuildContext context) => LoginPage(),
        "company_info": (BuildContext context) => WebPage(),
      },
      //指定加载页面
      home: LoadingPage(),
    ));
//自定义主题颜色
final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.deepPurpleAccent,
);

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
          url: "https://www.baidu.com",
          appBar: AppBar(
            title: Text('搜索'),
            leading: IconButton(
                icon: Icon(Icons.home),
              onPressed: (){
              Navigator.of(context).pushReplacementNamed('app');
            },
            ),
          ),
        );
  }
}