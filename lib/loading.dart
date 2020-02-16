import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //加载停留5秒
    Future.delayed(Duration(seconds: 5), () {
      print('软件启动。。。');
      Navigator.of(context).pushReplacementNamed("login");
    });
  }

  @override
  Widget build(BuildContext context) {
    //pageView(自行建立多广告启动界面)
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/timg.jpg'),
            Center(
              child: Text(
                '毕业设计',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    decoration: TextDecoration.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
