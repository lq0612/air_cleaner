import 'package:flutter/material.dart';
import 'package:air_cleaner/drawer_pages/favorite_page.dart';
import 'package:air_cleaner/drawer_pages/settings_page.dart';
import 'package:air_cleaner/drawer_pages/message_page.dart';


//抽屉的Demo
class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: //名字
            Text(
              'xx',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0,
              ),
            ),
            accountEmail: //邮箱
            Text(
                'xxxxx@foxmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontSize: 20.0,
              ),
            ),
            currentAccountPicture: //头像
            CircleAvatar(
              backgroundImage:
              NetworkImage(
                  'https://c-ssl.duitang.com/uploads/item/201511/21/20151121171107_zMZcy.jpeg'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: //头像背景图
              DecorationImage(
                image: NetworkImage(
                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1233390931,4044196373&fm=26&gp=0.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.yellow[400].withOpacity(0.6),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              '信息',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black54,
              size: 22.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MessagePage(),
              ));
            },
          ),
          ListTile(
            title: Text(
              '喜欢',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 22.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FavoritePage(),
              ));
            },
          ),
          ListTile(
            title: Text(
              '设置',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.black,
              size: 22.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SettingsPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}

