import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferenceManager<T> {
  late String key;

  SharedPreferenceManager(String key) {
    this.key = key;
  }

  Future<void> saveData(T data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(data);
    prefs.setString(key, jsonData);
  }

  Future<T?> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString(key);
    if (storedData != null) {
      return jsonDecode(storedData) as T;
    } else
      return null;
  }
}
