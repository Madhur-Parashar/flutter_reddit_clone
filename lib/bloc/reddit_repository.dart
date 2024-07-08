import 'package:flutter_demo/bloc/reddit_provider.dart';

class RedditRepository {
  final _redditProvider = RedditProvider();

  Future<Map<String, dynamic>> getRedditList() async {
    final Map<String, dynamic> list = await _redditProvider.fetchList();
    return list;
  }
}
