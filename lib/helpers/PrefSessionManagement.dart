import 'package:neostore/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefSessionManagement {
  static SharedPreferences _prefsInstance;
  static final String accessTokenKey = 'access_token';
	static final String userIdKey = 'user_id';
	static final String userNameKey = 'user_name';
	static final String userEmailKey = 'user_email';
  static final String userFullNameKey = 'user_full_name';

  static Future<SharedPreferences> get _instance async {
   return _prefsInstance ??= await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  void createSession(SharedPreferences prefs, User response) {
  
		prefs.setString(accessTokenKey, response.accessToken);
		prefs.setInt(userIdKey, response.id);
		prefs.setString(userNameKey, response.username);
    prefs.setString(userEmailKey, response.email);
    prefs.setString(userFullNameKey, response.firstName+''+response.lastName);
     print('PrefUtils');
	}

  static String getAccessToken(SharedPreferences prefs){
    return prefs.getString(accessTokenKey) !=null ? prefs.getString(accessTokenKey) : '';
  }


 
void clearSession(SharedPreferences prefs){
  prefs.clear();
}

}
