abstract class RedditState {}

class RedditInitialState extends RedditState {}

class RedditFetchListState extends RedditState {
  final Map<String, dynamic> redditList;
  RedditFetchListState({required this.redditList});
}
