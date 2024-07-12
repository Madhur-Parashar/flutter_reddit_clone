part of'reddit_list_bloc.dart';

sealed class RedditListEvent {}

final class RedditFetchListData extends RedditListEvent {}

final class RedditListLikeItem extends RedditListEvent {
  final String id;
  RedditListLikeItem({required this.id});
}

final class RedditListDislikeItem extends RedditListEvent {
  final String id;
  RedditListDislikeItem({required this.id});
}