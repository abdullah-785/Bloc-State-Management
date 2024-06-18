import 'dart:convert';

import 'package:bloc_app/Model/comment_post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostRepositery {
  Future<List<CommentPostModel>> fetchComments() async {
    String url = "https://jsonplaceholder.typicode.com/comments";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.toString()) as List;
        return body.map((e) {
          return CommentPostModel(
              postId: e['postId'],
              name: e['name'],
              email: e['email'],
              body: e['body']);
        }).toList();
      }
    } catch (e) {
      print(e);
    }

    return throw Exception("Error While Fetching Data");
  }
}
