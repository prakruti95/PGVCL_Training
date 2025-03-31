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
      // Fetch data from API only if online
      final data = await APIService.fetchData();
      await DBHelper.clearTable(); // Clear previous data to avoid duplicates
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
      users = localData.where((user) => user['isSynced'] == 1).toList();
    });
  }

  Future<void> addUser() async {
    final newUser = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'name': 'User ${DateTime.now().millisecondsSinceEpoch}',
      'surname': 'Surname',
      'email': 'user@example.com',
      'password': 'password123',
    };

    bool online = await ConnectivityHelper.isOnline();

    if (online) {
      bool success = await APIService.insertData(newUser);
      if (success) {
        await DBHelper.insertUser({
          ...newUser,
          'isSynced': 1,
        });
      }
    } else {
      await DBHelper.insertUser({
        ...newUser,
        'isSynced': 0,
      });
    }

    loadData();
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
        onPressed: addUser,
        child: Icon(Icons.add),
      ),
    );
  }
}
