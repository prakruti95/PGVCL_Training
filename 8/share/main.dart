import 'package:day82/post.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'local_storage_service.dart';
import 'network_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Caching Example',
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
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Number of items per row
          crossAxisSpacing: 10,  // Space between columns
          mainAxisSpacing: 10,  // Space between rows
          childAspectRatio: 1,  // Aspect ratio of each grid item
        ),
        padding: const EdgeInsets.all(10),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: post.url.isNotEmpty
                        ? CachedNetworkImage(
                      imageUrl: post.url,
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.image, size: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    post.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
