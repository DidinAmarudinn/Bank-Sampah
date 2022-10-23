import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreference;
  PreferencesHelper({required this.sharedPreference});

  static const fullName = 'FULLNAME';
  static const username = 'USERNAME';
  static const id = "ID";
  static const level = "LEVEL";
  static const imageProfileUrl = "IMAGE_PROFILE_URL";
  static const idBSU = "IDBSU";
  static const phoneNumber = "NoHp";
  static const email = "EMAIL";

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

  void setEmail(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(email, value);
  }

  Future<String?> getEmail() async {
    final prefs = await sharedPreference;
    return prefs.getString(email);
  }

  void setId(int value) async {
    final prefs = await sharedPreference;
    prefs.setInt(id, value);
  }

  Future<int?> getId() async {
    final prefs = await sharedPreference;
    return prefs.getInt(id);
  }

  void setPhoneNumber(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(phoneNumber, value);
  }

  Future<String?> getPhoneNumber() async {
    final prefs = await sharedPreference;
    return prefs.getString(phoneNumber);
  }

  void setIdBsu(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(idBSU, value);
  }

  Future<String?> getIdBsu() async {
    final prefs = await sharedPreference;
    return prefs.getString(idBSU);
  }

  void setLevel(String value) async {
    final prefs = await sharedPreference;
    prefs.setString(level, value);
  }

  Future<String?> getLevel() async {
    final prefs = await sharedPreference;
    return prefs.getString(level);
  }
}
