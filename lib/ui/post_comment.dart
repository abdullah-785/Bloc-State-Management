import 'package:flutter/material.dart';

class PostCommentUi extends StatefulWidget {
  const PostCommentUi({super.key});

  @override
  State<PostCommentUi> createState() => _PostCommentUiState();
}

class _PostCommentUiState extends State<PostCommentUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Post Comment Widget"),
    );
  }
}
