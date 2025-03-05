import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network_service.dart';
import 'local_storage_service.dart';
import 'post.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST API & Local Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final NetworkService _networkService = NetworkService();
  final LocalStorageService _localStorageService = LocalStorageService();
  List<Post> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  // Load posts from local storage or fetch from the API
  Future<void> _loadPosts() async {
    try {
      List<Post> localPosts = await _localStorageService.loadPosts();
      if (localPosts.isNotEmpty) {
        setState(() {
          _posts = localPosts;
          _isLoading = false;
        });
      } else {
        List<Post> apiPosts = await _networkService.fetchPosts();
        await _localStorageService.savePosts(apiPosts);
        setState(() {
          _posts = apiPosts;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error loading posts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _posts.isEmpty
          ? const Center(child: Text('No posts available.'))
          : ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
    );
  }
}
