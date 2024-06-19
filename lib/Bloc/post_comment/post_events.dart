import 'package:equatable/equatable.dart';

class PostEvents extends Equatable {
  @override
  List<Object> get props => const [];
}

class FetchPostCommentEvents extends PostEvents {}

class SearchPostCommentEvents extends PostEvents {
  String search;

  SearchPostCommentEvents(this.search);
}
