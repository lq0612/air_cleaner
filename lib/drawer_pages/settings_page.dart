import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static bool _switchA = false;
  static bool _switchB = false;
  static bool _switchC = false;

  _switchaccount() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('确认操作'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '取消',
                  style: TextStyle(
                      color: Colors.lightBlue[400],
                      fontSize: 20.0,
                      decoration: TextDecoration.none),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  '确定',
                  style: TextStyle(
                      color: Colors.lightBlue[100],
                      fontSize: 20.0,
                      decoration: TextDecoration.none),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('login');
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('设置'),
//        elevation: 0.0,
//      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              value: _switchA,
              onChanged: (value) {
                setState(() {
                  _switchA = value;
                });
              },
              title: Text('设置'),
              subtitle: Text('描述'),
              secondary:
                  Icon(_switchA ? Icons.visibility : Icons.visibility_off),
              selected: _switchA,
            ),
            SwitchListTile(
              value: _switchB,
              onChanged: (value) {
                setState(() {
                  _switchB = value;
                });
              },
              title: Text('设置'),
              subtitle: Text('描述'),
              secondary: Icon(_switchB ? Icons.videocam : Icons.videocam_off),
              selected: _switchB,
            ),
            SwitchListTile(
              value: _switchC,
              onChanged: (value) {
                setState(() {
                  _switchC = value;
                });
              },
              title: Text('设置'),
              subtitle: Text('描述'),
              secondary: Icon(_switchC ? Icons.flash_on : Icons.flash_off),
              selected: _switchC,
            ),
          ],
        ),
      ),
      bottomNavigationBar: OutlineButton(
        child: Text(
          '切换账号',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        onPressed: () {
          _switchaccount();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
