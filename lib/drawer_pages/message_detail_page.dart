import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/message.dart';

class MessageDetailPage extends StatelessWidget {
  final MessageItemModal item;

  MessageDetailPage({Key, key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(item.content),
        ));
  }
}