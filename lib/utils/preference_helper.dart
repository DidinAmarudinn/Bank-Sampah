import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreference;
  PreferencesHelper({required this.sharedPreference});

  static const fullName = 'FULLNAME';
  static const username = 'USERNAME';
  static const id = "ID";
  static const imageProfileUrl = "IMAGE_PROFILE_URL";

  void setFullName(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(fullName, value);
  }

  Future<String?> getFullName() async {
    final prefs = await sharedPreference;
    return prefs.getString(fullName);
  }
  void setImageProfileUrl(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(imageProfileUrl, value);
  }

  Future<String?> getImageProfileUrl() async {
    final prefs = await sharedPreference;
    return prefs.getString(imageProfileUrl);
  }

  void setUsername(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(username, value);
  }

  Future<String?> getUsername() async {
    final prefs = await sharedPreference;
    return prefs.getString(username);
  }

  void setId(int value) async {
    final prefs = await sharedPreference;
    prefs.setInt(id, value);
  }

  Future<int?> getId() async {
    final prefs = await sharedPreference;
    return prefs.getInt(id);
  }
}
