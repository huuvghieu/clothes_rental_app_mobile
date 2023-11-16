import 'dart:convert';

import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:http/http.dart' as http;

class ShopRepository {
  static String endpoint = '${AppString.baseURL}shops';
  static String? token;
  static List<ShopModel>? shopModels;

  Future<List<ShopModel>?> getShops() async {
    try {
      // token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse(endpoint), headers: headers);

      if (response.statusCode == 200) {
        final List result = jsonDecode(utf8.decode(response.bodyBytes));
        shopModels = result.map((e) => ShopModel.fromJson(e)).toList();
        return shopModels;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
