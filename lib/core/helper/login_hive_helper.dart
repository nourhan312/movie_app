import 'package:hive/hive.dart';

class TokenHelper {
  static const String TOKEN = "token";

  static void saveToken(String token) async {
    await Hive.box(TOKEN).put(TOKEN, token);
  }

  static String? getToken() {
    return Hive.box(TOKEN).get(TOKEN);
  }
}
