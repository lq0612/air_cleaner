import 'package:flutter/material.dart';
import '../model/message.dart';
import '../services/message.dart';
import '../drawer_pages/message_detail_page.dart';

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  MessageListModal listData = MessageListModal([]);

  //获取信息列表数据
  void getMessageList() async {
    var data = await getMessageResult();
    MessageListModal list = MessageListModal.fromJson(data);
    if (mounted) {
      //防止内存泄漏
      setState(() {
        listData.data.addAll(list.data);
      });
    }
//    setState(() {
//      listData.data.addAll(list.data);
//    });
  }

  @override
  void initState() {
    getMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        title: Text('信息'),
        elevation: 0.0,
      ),                       */
      //带分割线的list
      body: ListView.separated(
        //排列方向 垂直和水平
        scrollDirection: Axis.vertical,
        //分割线构建
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: listData.data.length,
        //列表项构建
        itemBuilder: (BuildContext context, int index) {
          //信息列表项数据
          MessageItemModal item = listData.data[index];

          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.message),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            //信息详情页面
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageDetailPage(item: item)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}