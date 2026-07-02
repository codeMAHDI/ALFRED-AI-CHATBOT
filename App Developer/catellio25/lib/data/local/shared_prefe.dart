// ignore: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefsHelper {

  static Future<String> getString(String key,{String defaultValue = ''}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? defaultValue;
  }



  static Future<List<String>> getLisOfString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var getListData = preferences.getStringList(key);

    return getListData!;
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(key);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? (-1);
  }


  static Future<void> setString(String key, String? value) async {

    if (value != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } else {
      debugPrint("Warning: Trying to set a null value for key: $key");
    }
  }


  static Future<bool> setListOfString(String key, List<String> value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var setListData = await preferences.setStringList(key, value);

    return setListData;
  }

  static Future setBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, value);
  }

  static Future setInt(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(key, value);
  }


  static Future remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }


  static Future<void> saveUserLocally(String email, String phone) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> emails = prefs.getStringList("emails") ?? [];
    List<String> phones = prefs.getStringList("phones") ?? [];

    if (!emails.contains(email.trim())) {
      emails.add(email.trim());
    }
    if (!phones.contains(phone.trim())) {
      phones.add(phone.trim());
    }

    await prefs.setStringList("emails", emails);
    await prefs.setStringList("phones", phones);

    await prefs.setString("currentUserEmail", email.trim());
    await prefs.setString("currentUserPhone", phone.trim());
  }



  static Future<bool> isPhoneExists(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> phones = prefs.getStringList("phones") ?? [];
    String? currentUserPhone = prefs.getString("currentUserPhone");

    if (currentUserPhone != null && currentUserPhone == phone.trim()) {
      return false;
    }

    return phones.contains(phone.trim());
  }





  ///========Save String Value =======
  static Future<void> saveData(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<void> saveString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

}