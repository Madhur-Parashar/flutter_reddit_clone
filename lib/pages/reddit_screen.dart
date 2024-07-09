import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_bloc.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_state.dart';

import 'package:flutter_demo/widgets/reddit_listing.dart';
import 'package:flutter_demo/constant/constant.dart' as constant;

class RedditScreen extends StatefulWidget {
  const RedditScreen({super.key});

  @override
  State<RedditScreen> createState() => _RedditScreenState();
}

class _RedditScreenState extends State<RedditScreen> {
  @override
  initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    //  print('loading data....');
    try {
      BlocProvider.of<RedditListBloc>(context).add(RedditFetchListData());
    } catch (err) {
      print('Response error: ${err}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.network(
                constant.REDDIT_LOGO,
                width: 32,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("Reddit"),
              )
            ],
          ),
        ),
        body: BlocBuilder<RedditListBloc, RedditState>(builder: (context, state) {
          if (state is RedditListState) {
            return RedditListing(
                redditList: state.redditList['data']['children']);
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 244, 95, 15),
          ));
        }));
  }
}
