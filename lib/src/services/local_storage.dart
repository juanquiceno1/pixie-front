import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  get token {
    return prefs.getString('token') ?? '';
  }

  set setToken(String value) {
    prefs.setString('token', value);
  }

  get rememberEmail {
    return prefs.getString('remember-email') ?? '';
  }

  get onboarding {
    return prefs.getBool('onboarding') ?? false;
  }

  set setOnboarding(bool value) {
    prefs.setBool('onboarding', value);
  }

  set setRememberEmail(String value) {
    prefs.setString('remember-email', value);
  }
}
