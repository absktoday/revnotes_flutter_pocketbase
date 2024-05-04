import 'package:pocketbase/pocketbase.dart';
import 'package:revnotes_flutter_pocketbase/src/config/pocketbase_config.dart';

class PB {
  static final _pb = PocketBase(PocketBaseConfig.baseUrl);

  static void signIn(String email, String password) async {
    print("Email: $email Password: $password");

    try {
      var authRecord =
          await _pb.collection('users').authWithPassword(email, password);
      print("record $authRecord");
    } catch (error) {
      print("Could not complete sign in $error");

      if (error is ClientException) {}
    }
  }
}
