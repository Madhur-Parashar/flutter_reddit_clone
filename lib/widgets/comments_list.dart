import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/comment.dart';

class CommentsList extends StatelessWidget {
  CommentsList(this.commentList, {super.key});

  List<dynamic> commentList = [];

  @override
  Widget build(context) {
    return Column(children: [
      ...commentList.map((item) {
        if (item['kind'] != 'more') {
          return Comment(item['data']);
        }
        return SizedBox();
      })
    ]);
  }
}
