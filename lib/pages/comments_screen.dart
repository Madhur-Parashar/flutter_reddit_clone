import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/reddit_comments_bloc/reddit_comments_bloc.dart';
import 'package:flutter_demo/bloc/reddit_comments_bloc/reddit_comments_state.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_bloc.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_state.dart';
import 'package:flutter_demo/constant/constant.dart';

import 'package:flutter_demo/widgets/comments_list.dart';
import 'package:flutter_demo/widgets/reddit_card.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen(this.redditList, {super.key});

  final Map<String, dynamic> redditList;

  @override
  State<CommentsScreen> createState() => _CommentsScreen();
}

class _CommentsScreen extends State<CommentsScreen> {
  @override
  initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() async {
    var id = widget.redditList['id'].toString();
    try {
      BlocProvider.of<RedditCommentBloc>(context)
          .add(RedditFetchCommentsList(id: id));
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
              BlocBuilder<RedditListBloc, RedditState>(
                  builder: (context, state) {
                if (state is RedditListState) {
                  return RedditCard(redditItem: widget.redditList);
                }
                return const Center(child: Text("Loading comment..."));
              }),
              BlocBuilder<RedditCommentBloc, RedditCommentsState>(
                  builder: (context, state) {
                if (state is RedditCommentsListState) {
                  return CommentsList(
                      state.redditCommentsList[1]['data']['children']);
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: REDDIT_COLOR,
                ));
              })
            ],
          ),
        ));
  }
}
