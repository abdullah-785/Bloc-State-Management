import 'package:bloc_app/Bloc/post_comment/post_bloc.dart';
import 'package:bloc_app/Bloc/post_comment/post_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCommentUi extends StatefulWidget {
  const PostCommentUi({super.key});

  @override
  State<PostCommentUi> createState() => _PostCommentUiState();
}

class _PostCommentUiState extends State<PostCommentUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        return ListView.builder(itemBuilder: (context, index) {
          return ListTile();
        });
      }),
    );
  }
}
