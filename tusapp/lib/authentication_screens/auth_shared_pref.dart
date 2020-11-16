import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPref {
  static AuthSharedPref _instance;
  AuthSharedPref._();

  static const _authKey = 'AUTH_REMEMBER_ME_PREF';

  static AuthSharedPref get instance {
    return _instance ?? AuthSharedPref._();
  }

  Future<SharedPreferences> _getSharedPreferenceInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setRememberPasswd() async {
    SharedPreferences pref = await _getSharedPreferenceInstance();
    pref.setBool(_authKey, true);
  }

  Future<void> setForgetPassword() async {
    SharedPreferences pref = await _getSharedPreferenceInstance();
    pref.setBool(_authKey, false);
  }

  Future<bool> remembersPasswd() async {
    SharedPreferences pref = await _getSharedPreferenceInstance();
    if (pref.containsKey(_authKey)) {
      return pref.getBool(_authKey);
    }
    return false;
  }
}
