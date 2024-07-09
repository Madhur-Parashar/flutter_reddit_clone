abstract class RedditCommentsState {}

class RedditCommentsInitialState extends RedditCommentsState {}

class RedditCommentsListState extends RedditCommentsState {
  final List<dynamic> redditCommentsList;
  RedditCommentsListState({required this.redditCommentsList});
}
