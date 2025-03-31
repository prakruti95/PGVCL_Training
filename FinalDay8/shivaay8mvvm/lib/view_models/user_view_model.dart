import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../services/db_helper.dart';
import '../services/connectivity_helper.dart';

class UserViewModel extends ChangeNotifier {
  List<UserModel> users = [];

  // ✅ Load Users (API + DB)
  Future<void> loadUsers() async {
    bool online = await ConnectivityHelper.isOnline();

    if (online) {
      users = await APIService.fetchData();
      for (var user in users) {
        await DBHelper.insertUser(user);
      }
    } else {
      users = await DBHelper.fetchUsers();
    }

    notifyListeners();
  }

  // ✅ Add User (Online/Offline)
  Future<void> addUser(UserModel user) async {
    bool online = await ConnectivityHelper.isOnline();

    if (online) {
      bool success = await APIService.insertData(user);
      user.isSynced = success ? 1 : 0;
    }

    await DBHelper.insertUser(user);
    loadUsers();
  }
}
