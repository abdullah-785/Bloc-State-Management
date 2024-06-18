import 'package:bloc_app/Model/comment_post_model.dart';
import 'package:bloc_app/Utils/status.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  PostStatus postStatus;
  List<CommentPostModel> postList;
  String message;

  PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.message = "",
  });

  PostStates copyWith({
    PostStatus? postStatus,
    List<CommentPostModel>? postList,
    String? message,
  }) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList, message];
}
