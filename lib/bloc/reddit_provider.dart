import 'package:http/http.dart' as http;
import "dart:convert";

import 'package:flutter_demo/constant/constant.dart' as constant;

class RedditProvider {
  Future<Map<String, dynamic>> fetchList() async {
    final queryParameters = {
      'limit': '10',
    };
    var url = Uri.https('oauth.reddit.com', '/r/apple', queryParameters);
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${constant.AUTORIZATION_TOKEN}',
      'Content-Type': 'application/json',
    });
    Map<String, dynamic> listData = json.decode(response.body);
    return listData;
  }

  Future<List> fetchCommentsList(id) async {
    var url = Uri.https('oauth.reddit.com', '/r/apple/comments/$id');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${constant.AUTORIZATION_TOKEN}',
      'Content-Type': 'application/json',
    });
    List listData = json.decode(response.body);
    return listData;
  }
}
