import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_demo/bloc/reddit_repository.dart';
import 'package:flutter_demo/bloc/reddit_state.dart';

sealed class RedditListEvent {}

final class RedditFetchListData extends RedditListEvent {}

class RedditBloc extends Bloc<RedditListEvent, RedditState> {
  RedditBloc() : super(RedditInitialState()) {
    final redditRepository = RedditRepository();
    on<RedditFetchListData>((event, emit) async {
      // handle incoming `CounterIncrementPressed` event
      try {
        final Map<String, dynamic> list =
            await redditRepository.getRedditList();
        emit(RedditFetchListState(redditList: list));
      } catch (error) {}
    });
  }
}
