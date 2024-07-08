import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/reddit_bloc.dart';
import 'package:flutter_demo/bloc/reddit_state.dart';

import 'package:flutter_demo/widgets/reddit_listing.dart';
import 'package:flutter_demo/constant/constant.dart' as constant;

class RedditContainer extends StatefulWidget {
  const RedditContainer({super.key});

  @override
  State<RedditContainer> createState() => _RedditContainerState();
}

class _RedditContainerState extends State<RedditContainer> {

  @override
  initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    //  print('loading data....');
    try {
      BlocProvider.of<RedditBloc>(context).add(RedditFetchListData());
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
        body: BlocBuilder<RedditBloc, RedditState>(builder: (context, state) {
          if (state is RedditFetchListState) {
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
