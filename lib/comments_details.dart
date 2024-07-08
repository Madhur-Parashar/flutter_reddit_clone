import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:flutter_demo/constant/constant.dart' as constant;

import 'package:flutter_demo/reddit_card.dart';
import 'package:flutter_demo/comment.dart';
import 'package:flutter_demo/comments_container.dart';

class CommentsDetails extends StatefulWidget {
  const CommentsDetails(this.redditList, {super.key});

  final redditList;

  @override
  State<CommentsDetails> createState() => _CommentsDetails();
}

class _CommentsDetails extends State<CommentsDetails> {
  List<dynamic> _commentList = [];

  @override
  initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() async {
    final queryParameters = {
      'limit': '10',
    };
    var id = widget.redditList['id'].toString();
    try {
      var url = Uri.https('oauth.reddit.com', '/r/apple/comments/$id');
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${constant.AUTORIZATION_TOKEN}',
        'Content-Type': 'application/json',
      });
      var comments = json.decode(response.body);
      print('Response body: ${comments}');
      print('Response comments: ${comments[1]['data']['children']}');
      setState(() {
        _commentList = comments[1]['data']['children'];
      });

      // print('Response status: $_redditList');
      // print('Response comments: ${_commentList}');
    } catch (err) {
      print('Response error: ${err}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('r/apple'),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              RedditCard(redditItem: widget.redditList),
              CommentsContainer(_commentList)
            ],
          ),
        ));
  }
}
