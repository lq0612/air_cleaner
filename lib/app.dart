import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_cleaner/pages/about_us_page.dart';
import 'package:air_cleaner/pages/home_page.dart';
import 'package:air_cleaner/pages/news_page.dart';
import 'package:air_cleaner/pages/product_page.dart';
import 'package:air_cleaner/demo/drawer_demo.dart';
//import 'package:url_launcher/url_launcher.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  //当前选择页面索引
  var _currentIndex = 0;
  HomePage homePage;
  ProductPage productPage;
  AboutPage aboutPage;
  NewsPage newsPage;

//根据当前索引返回不同页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
      case 3:
        if (aboutPage == null) {
          aboutPage = AboutPage();
        }
        return aboutPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('空气净化器'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap:(){
                Navigator.of(context).pushReplacementNamed('company_info');
              },//_launchURL,
              child: Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
      body: currentPage(),
      drawer: DrawerDemo(),
      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('产品'),
            icon: Icon(Icons.shopping_basket),
          ),
          BottomNavigationBarItem(
            title: Text('新闻'),
            icon: Icon(Icons.fiber_new),
          ),
          BottomNavigationBarItem(
            title: Text('空气质量'),
            icon: Icon(Icons.cloud),
          ),
        ],
      ),
    );
  }
}

//_launchURL() async {
//  const url = 'https://www.baidu.com';
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
//}
