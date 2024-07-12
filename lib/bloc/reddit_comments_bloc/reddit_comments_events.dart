part of 'reddit_comments_bloc.dart';

sealed class RedditCommentListEvent {}

final class RedditFetchCommentsList extends RedditCommentListEvent {
  final String id;
  RedditFetchCommentsList({required this.id});
}
