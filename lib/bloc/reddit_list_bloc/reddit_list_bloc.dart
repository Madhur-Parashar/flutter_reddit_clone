import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_demo/bloc/reddit_repository.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_state.dart';
part 'reddit_list_events.dart';

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
    on<RedditListLikeItem>((event, emit) async {
      try {
        print("state$state");
        if (state is RedditListState) {
          final currentState = state as RedditListState;
          final Map<String, dynamic> updatedList =
              Map.from(currentState.redditList);

          for (var child in updatedList['data']['children']) {
            if (child['data']['id'] == event.id) {
              if (child['data']['isUpVote'] == true) {
                child['data']['ups'] -= 1;
                child['data']['isUpVote'] = false;
              } else {
                child['data']['ups'] += 1;
                child['data']['isUpVote'] = true;
              }

              break;
            }
          }

          emit(RedditListState(redditList: updatedList));
        }
      } catch (error) {}
    });
    on<RedditListDislikeItem>((event, emit) async {
      try {
        print("state$state");
        if (state is RedditListState) {
          final currentState = state as RedditListState;
          final Map<String, dynamic> updatedList =
              Map.from(currentState.redditList);

          for (var child in updatedList['data']['children']) {
            if (child['data']['id'] == event.id) {
              if (child['data']['isDownVote'] == true) {
                child['data']['downs'] -= 1;
                child['data']['isDownVote'] = false;
              } else {
                child['data']['downs'] += 1;
                child['data']['isDownVote'] = true;
              }

              break;
            }
          }

          emit(RedditListState(redditList: updatedList));
        }
      } catch (error) {}
    });
  }
}
