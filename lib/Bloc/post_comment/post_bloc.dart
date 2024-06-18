import 'package:bloc/bloc.dart';
import 'package:bloc_app/Bloc/post_comment/post_events.dart';
import 'package:bloc_app/Bloc/post_comment/post_states.dart';
import 'package:bloc_app/Repository/post_repositery.dart';
import 'package:bloc_app/Utils/status.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepositery postRepositery = PostRepositery();
  PostBloc() : super(PostStates()) {
    on<FetchPostCommentEvents>(fetchPostComments);
  }
  // PostBloc():

  void fetchPostComments(
      FetchPostCommentEvents events, Emitter<PostStates> emit) {
    postRepositery.fetchComments().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, postList: value, message: "success"));
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            postStatus: PostStatus.failure, message: error.toString()));
      },
    );
  }
}
