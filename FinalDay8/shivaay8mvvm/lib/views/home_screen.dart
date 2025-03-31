import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../view_models/user_view_model.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Sync App')),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          if (userViewModel.users.isEmpty) {
            return Center(child: Text('No Users Available'));
          }

          return ListView.builder(
            itemCount: userViewModel.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userViewModel.users[index].name),
                subtitle: Text(userViewModel.users[index].email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var user = UserModel(
            id: DateTime.now().millisecondsSinceEpoch,
            name: "User ${DateTime.now().millisecondsSinceEpoch}",
            surname: "Surname",
            email: "user@example.com",
            password: "password123",
          );
          Provider.of<UserViewModel>(context, listen: false).addUser(user);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
