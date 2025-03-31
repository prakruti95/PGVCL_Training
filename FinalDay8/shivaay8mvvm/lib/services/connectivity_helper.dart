import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/user.dart';
import 'api_service.dart';
import 'db_helper.dart';

class ConnectivityHelper {
  static Future<bool> isOnline() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // ✅ Sync ONLY the last unsynced entry
  static Future<void> syncLastOfflineEntry() async {
    final db = await DBHelper.initializeDB();

    // Fetch ONLY the last unsynced user (sorted by ID)
    final List<Map<String, dynamic>> offlineUsers = await db.query(
      'users',
      where: 'isSynced = 0',
      orderBy: 'id DESC', // ✅ Get the latest entry first
      limit: 1, // ✅ Only fetch the last unsynced entry
    );

    if (offlineUsers.isNotEmpty) {
      UserModel userModel = UserModel.fromMap(offlineUsers.first);

      bool success = await APIService.insertData(userModel);
      if (success) {
        await DBHelper.updateUserAsSynced(userModel.id);
      }
    }
  }

  // ✅ Monitor Connectivity and Sync the Last Entry
  static void monitorConnectivity() {
    Connectivity().onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none) {
        await syncLastOfflineEntry();
      }
    });
  }
}
