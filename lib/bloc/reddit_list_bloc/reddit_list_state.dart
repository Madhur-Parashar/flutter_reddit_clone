abstract class RedditState {}

class RedditInitialState extends RedditState {}

class RedditListState extends RedditState {
  final Map<String, dynamic> redditList;
  RedditListState({required this.redditList});
}
