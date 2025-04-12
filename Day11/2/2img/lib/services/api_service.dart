import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ApiService {
  static const _proxyUrl = 'https://api.allorigins.win/raw?url=https://prakrutitech.buzz/AndroidAPI/dashboard_view.php';

  static Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(_proxyUrl));

    print('⚙️ FETCHING API...');
    print('Status Code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print('✅ Items received: ${data.length}');
      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      print('❌ Failed: ${response.statusCode}');
      throw Exception('Failed to load items: ${response.statusCode}');
    }
  }
}
