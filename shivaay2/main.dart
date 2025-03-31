import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'api_service.dart';
import 'connectivity_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    ConnectivityHelper.monitorConnectivity();
    loadData();
  }

  Future<void> loadData() async {
    bool online = await ConnectivityHelper.isOnline();

    if (online) {
      await APIService.syncOfflineData();
      final data = await APIService.fetchData();
      for (var user in data) {
        await DBHelper.insertUser({
          'id': user['id'],
          'name': user['name'],
          'surname': user['surname'],
          'email': user['email'],
          'password': user['password'],
          'isSynced': 1
        });
      }
    }

    final localData = await DBHelper.fetchUsers();
    setState(() {
      users = localData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Sync App')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['name']),
            subtitle: Text(users[index]['email']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await DBHelper.insertUser({
            'id': DateTime.now().millisecondsSinceEpoch,
            'name': 'New User',
            'surname': 'Surname',
            'email': 'newuser@example.com',
            'password': 'password123',
            'isSynced': 0
          });
          loadData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
