import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_demo/bloc/reddit_repository.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_state.dart';

sealed class RedditListEvent {}

final class RedditFetchListData extends RedditListEvent {}

final class RedditFetchCommentsList extends RedditListEvent {
  final String id;
  RedditFetchCommentsList({required this.id});
}

class RedditListBloc extends Bloc<RedditListEvent, RedditState> {
  RedditListBloc() : super(RedditInitialState()) {
    final redditRepository = RedditRepository();
    on<RedditFetchListData>((event, emit) async {
      try {
        final Map<String, dynamic> list =
            await redditRepository.getRedditList();
        emit(RedditListState(redditList: list));
      } catch (error) {}
    });
  }
}
