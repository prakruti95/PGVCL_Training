import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:day82/post.dart';

class NetworkService {
  final String apiUrl = "https://prakrutitech.buzz/AndroidAPI/dashboard_view.php";

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
