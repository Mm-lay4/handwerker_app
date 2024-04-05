import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/constants/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: change Type String with custom Userclass
final userProvider = NotifierProvider<UserProvider, String?>(() {
  return UserProvider();
});

// TODO: change Type String with custom Userclass
class UserProvider extends Notifier<String?> {
  final Api api = Api();
  final _storage = SharedPreferences.getInstance();
  @override
// TODO: change Type String with custom Userclass
  String? build() => 'f7e8b09a-ac4f-4a30-a7c5-b6f829cff9aa';
  void userLogOut() {
    state = null;
    deleteToken();
  }

  void userLogIn(mandant, {required String username, required String password}) async {
    final loginData = {
      "username": username,
      "password": password,
      "mandant": mandant,
    };
    try {
      final respone = await api.postloginUser(loginData);
      if (respone.statusCode == 200) {
        final token = respone.data;
        setToken(token: token);
        // TODO: implement a User and create this User
        // ignore: prefer_const_declarations, unused_local_variable
        final newUser = 'a new User must be initalized';
        return;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void deleteToken() async {
    final storage = await _storage;
    if (storage.containsKey('token')) storage.clear();
    return;
  }

  Future<String?> getUserToken() async {
    final storage = await _storage;
    if (storage.containsKey('token')) {
      return storage.getString('token');
    }
    return null;
  }

  void setToken({required String token}) async =>
      await _storage.then((value) => value.setString('token', token));
}
