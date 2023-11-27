import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static final _box = GetStorage();
  static const String _loggedInKey = 'isLoggedIn';

  static bool get isLoggedIn => _box.read(_loggedInKey) ?? false;

  static Future<void> setLoggedIn(bool value) async {
    await _box.write(_loggedInKey, value);
  }
}