//新闻数据
class MessageItemModal {
  String author;
  String title;
  String content;

  MessageItemModal({
    this.author,
    this.title,
    this.content,
  });

  factory MessageItemModal.fromJson(dynamic json) {
    return MessageItemModal(
      author: json['author'],
      title: json['title'],
      content: json['content'],
    );
  }
}

//新闻列表数据转换
class MessageListModal {
  List<MessageItemModal> data;
  MessageListModal(this.data);
  factory MessageListModal.fromJson(List json) {
    return MessageListModal(json.map((i) => MessageItemModal.fromJson((i))).toList());
  }
}