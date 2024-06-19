import 'package:bloc/bloc.dart';
import 'package:bloc_app/Bloc/post_comment/post_events.dart';
import 'package:bloc_app/Bloc/post_comment/post_states.dart';
import 'package:bloc_app/Model/comment_post_model.dart';
import 'package:bloc_app/Repository/post_repositery.dart';
import 'package:bloc_app/Utils/status.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepositery postRepositery = PostRepositery();
  List<CommentPostModel> temPostList = [];
  PostBloc() : super(PostStates()) {
    on<FetchPostCommentEvents>(fetchPostComments);
    on<SearchPostCommentEvents>(_searchPostComments);
  }
  // PostBloc():

  Future<void> fetchPostComments(
      FetchPostCommentEvents events, Emitter<PostStates> emit) async {
    await postRepositery.fetchComments().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, postList: value, message: "success"));
    }).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
        emit(state.copyWith(
            postStatus: PostStatus.failure, message: error.toString()));
      },
    );
  }

  void _searchPostComments(
      SearchPostCommentEvents events, Emitter<PostStates> emit) {
    print(events.search);
    temPostList = state.postList
        .where(
          (element) => element.name.toString() == events.search.toString(),
        )
        .toList();

    print(temPostList);

    emit(state.copyWith(
      temPostList: temPostList,
      postStatus: PostStatus.success,
    ));
    print(temPostList);
  }
}
