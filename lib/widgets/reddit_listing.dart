import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/reddit_card.dart';
import 'package:flutter_demo/pages/comments_screen.dart';

class RedditListing extends StatelessWidget {
  RedditListing({super.key, required this.redditList});

  List<dynamic> redditList;

  void _commentTapHandler(BuildContext context, redditList) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommentsScreen(redditList)),
    );
  }

  @override
  Widget build(context) {
    return ListView.separated(
      itemCount: redditList.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              _commentTapHandler(context, redditList[index]['data']);
            },
            child: RedditCard(redditItem: redditList[index]['data']));
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
