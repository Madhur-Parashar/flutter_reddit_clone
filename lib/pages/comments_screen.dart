import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/reddit_comments_bloc/reddit_comments_bloc.dart';
import 'package:flutter_demo/bloc/reddit_comments_bloc/reddit_comments_state.dart';

import 'package:flutter_demo/widgets/reddit_card.dart';
import 'package:flutter_demo/widgets/comments_container.dart';

class CommentsDetails extends StatefulWidget {
  const CommentsDetails(this.redditList, {super.key});

  final Map<String, dynamic> redditList;

  @override
  State<CommentsDetails> createState() => _CommentsDetails();
}

class _CommentsDetails extends State<CommentsDetails> {
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
              RedditCard(redditItem: widget.redditList),
              BlocBuilder<RedditCommentBloc, RedditCommentsState>(
                  builder: (context, state) {
                if (state is RedditCommentsListState) {
                  return CommentsContainer(
                      state.redditCommentsList[1]['data']['children']);
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 244, 95, 15),
                ));
              })
            ],
          ),
        ));
  }
}
