import 'package:bloc_app/Bloc/post_comment/post_bloc.dart';
import 'package:bloc_app/Bloc/post_comment/post_events.dart';
import 'package:bloc_app/Bloc/post_comment/post_states.dart';
import 'package:bloc_app/Utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCommentUi extends StatefulWidget {
  const PostCommentUi({super.key});

  @override
  State<PostCommentUi> createState() => _PostCommentUiState();
}

class _PostCommentUiState extends State<PostCommentUi> {
  // TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPostCommentEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Comments"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                context.read<PostBloc>().add(SearchPostCommentEvents(value));
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
            switch (state.postStatus) {
              case PostStatus.loading:
                return Center(child: CircularProgressIndicator());
              case PostStatus.success:
                return Expanded(
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: state.temPostList.isEmpty
                            ? state.postList.length
                            : state.temPostList.length,
                        itemBuilder: (context, index) {
                          if (state.temPostList.isNotEmpty) {
                            final item = state.temPostList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  item.name.toString(),
                                ),
                                subtitle: Text(item.body.toString()),
                                leading: Text(item.postId.toString()),
                              ),
                            );
                          } else {
                            final item = state.postList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  item.name.toString(),
                                ),
                                subtitle: Text(item.body.toString()),
                                leading: Text(item.postId.toString()),
                              ),
                            );
                          }
                        }),
                  ),
                );

              case PostStatus.failure:
                return Center(child: Text(state.message));
            }
          }),
        ],
      ),
    );
  }
}
