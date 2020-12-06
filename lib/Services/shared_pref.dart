import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  //preference will be set after authentification only

  //for our app we will store:
  //2. user type as "userType" - to detect loggedInState and to show widgets according to user
  //3. user id as "userId" - to identify who manipulated data

  Future<void> setToSharedPref({String key, String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  Future<String> getFromSharedPref({String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(key)) {
      return preferences.getString(key);
    } else
      return null;
  }
}
