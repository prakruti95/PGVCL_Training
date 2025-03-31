import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class APIService {
  static const String apiUrl = 'https://prakrutitech.buzz/Fluttertestapi/view.php';
  static const String insertApi = 'https://prakrutitech.buzz/Fluttertestapi/insert.php';

  // ✅ Fetch Data from API
  static Future<List<UserModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("❌ API Fetch Error: $e");
      return [];
    }
  }

  // ✅ Insert Data to API
  static Future<bool> insertData(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(insertApi),
        body: user.toJson(),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('❌ API Insert Error: $e');
      return false;
    }
  }
}
