import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'post.dart';

class LocalStorageService {
  // Method to save posts to local storage
  Future<void> savePosts(List<Post> posts) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> postsJson = posts.map((post) => json.encode(post.toJson())).toList();
    await prefs.setStringList('posts', postsJson);  // Store as a list of JSON strings
  }

  // Method to load posts from local storage
  Future<List<Post>> loadPosts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? postsJson = prefs.getStringList('posts');

    if (postsJson != null) {
      return postsJson.map((post) => Post.fromJson(json.decode(post))).toList();
    } else {
      return [];  // Return an empty list if no posts are found
    }
  }
}
