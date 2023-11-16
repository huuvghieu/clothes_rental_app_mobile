import 'dart:convert';

import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/price_list_model.dart';
import 'package:http/http.dart' as http;

class PriceListRepository {
  static String endpoint = '${AppString.baseURL}prices';
  static String? token;
  static List<PriceListModel>? priceListModel;

  Future<List<PriceListModel>?> getPriceLists(String id) async {
    try {
      // token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endpoint?comboId=$id'), headers: headers);

      if (response.statusCode == 200) {
        final List result = jsonDecode(utf8.decode(response.bodyBytes));
        priceListModel = result.map((e) => PriceListModel.fromJson(e)).toList();
        return priceListModel;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
