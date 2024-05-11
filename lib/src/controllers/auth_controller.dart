import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:revnotes_flutter_pocketbase/src/config/pocketbase_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  late final PocketBase pb;

  bool isLoggedIn = false;
  bool isValid = false;

  void signIn(String username, String password) async {
    isLoggedIn = true;

    try {
      await pb.collection('users').authWithPassword(username, password);
    } on ClientException catch (e) {
      print("Sign In Error: $e");
    }

    notifyListeners();
  }

  void signOut() {
    pb.authStore.clear();
    notifyListeners();
  }

  AuthController() {
    initPB();
  }

  Future<void> initPB() async {
    // Initialize PocketBase
    final prefs = await SharedPreferences.getInstance();

    final store = AsyncAuthStore(
      save: (String data) async => prefs.setString('pb_auth', data),
      initial: prefs.getString('pb_auth'),
    );

    pb = PocketBase(PocketBaseConfig.baseUrl, authStore: store);

    pb.authStore.onChange.listen((event) {
      isValid = pb.authStore.isValid;
      notifyListeners();
    });

    if (pb.authStore.isValid) {
      print('Already Logged In Refreshing Auth');
      isValid = pb.authStore.isValid;
      await pb.collection('users').authRefresh();
    }
    notifyListeners();
  }
}
