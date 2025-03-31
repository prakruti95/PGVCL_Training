import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shivaay8mvvm/view_models/user_view_model.dart';
import 'views/home_screen.dart';
import 'services/connectivity_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityHelper.monitorConnectivity();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel()..loadUsers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
