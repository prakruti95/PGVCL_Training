import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'post.dart';

class LocalStorageService {
  Future<void> savePosts(List<Post> posts) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> postsJson = posts.map((post) => json.encode(post.toJson())).toList();
    await prefs.setStringList('posts', postsJson);
  }

  Future<List<Post>> loadPosts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? postsJson = prefs.getStringList('posts');
    if (postsJson != null) {
      return postsJson.map((post) => Post.fromJson(json.decode(post))).toList();
    } else {
      return [];
    }
  }
}
