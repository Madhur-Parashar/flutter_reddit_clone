import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_demo/bloc/reddit_repository.dart';
import 'package:flutter_demo/bloc/reddit_comments_bloc/reddit_comments_state.dart';
part 'reddit_comments_events.dart';

class RedditCommentBloc
    extends Bloc<RedditCommentListEvent, RedditCommentsState> {
  RedditCommentBloc() : super(RedditCommentsInitialState()) {
    final redditRepository = RedditRepository();
    on<RedditFetchCommentsList>((event, emit) async {
      try {
        final List list =
            await redditRepository.getRedditCommentsList(event.id);
        emit(RedditCommentsListState(redditCommentsList: list));
      } catch (error) {}
    });
  }
}
