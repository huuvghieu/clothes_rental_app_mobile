import 'dart:convert';

import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/user_model.dart';
import 'package:clothes_rental_mobile/services/network_handler.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static String endpoint = '${AppString.baseURL}authentications';

  static Future<dynamic> login(String userName, String password) async {
    var response = await http.post(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': userName,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final result = UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      String token = result.accessToken.toString();
      NetWorkHandler.storeToken(token);
      NetWorkHandler.storeId(result.id);
      return UserModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return response.body.toString();
    }
  }

  // static Future<dynamic> loginWithGoogle(
  //     String idToken, String clientId, String clientSecret) async {
  //   var response = await http.post(
  //     Uri.parse("$baseUrl/google/login"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'idToken': idToken,
  //       'clientId': clientId,
  //       'clientSecret': clientSecret,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     final result = Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //     String token = result.token.toString();
  //     Customer user = (result.user as Customer);
  //     NetWorkHandler.storeToken(token);
  //     NetWorkHandler.storeId(user.id);
  //     return Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //   } else {
  //     return response.body.toString();
  //   }
  // }
}
