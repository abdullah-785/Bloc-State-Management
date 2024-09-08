import 'dart:convert';

import 'package:bloc_app/bloc_model/comment_post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:http/http.dart';

class PostRepositery {
  Future<List<CommentPostModel>> fetchComments() async {
    String url = "https://jsonplaceholder.typicode.com/comments";

    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return CommentPostModel(
              postId: e['postId'] as int,
              name: e['name'] as String,
              email: e['email'] as String,
              body: e['body'] as String);
        }).toList();
      }
    } catch (e) {
      // print(e);
      return throw Exception(e);
    }

    return throw Exception("Error While Fetching Data");
  }
}
