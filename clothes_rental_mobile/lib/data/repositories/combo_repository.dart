import 'dart:convert';

import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/combo_model.dart';
import 'package:clothes_rental_mobile/data/models/product_combo_model.dart';
import 'package:http/http.dart' as http;

class ComboRepository {
  static String endpoint = '${AppString.baseURL}combos';
  static String? token;
  static List<ComboModel>? comboModels;
  static List<ProductComboModel>? productCombos;

  Future<List<ComboModel>?> getCombos() async {
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
        comboModels = result.map((e) => ComboModel.fromJson(e)).toList();
        return comboModels;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductComboModel>?> getProductCombos(String id) async {
    try {
      // token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token'
      };
      http.Response response = await http
          .get(Uri.parse('$endpoint/$id/products-combo'), headers: headers);

      if (response.statusCode == 200) {
        final List result = jsonDecode(utf8.decode(response.bodyBytes));
        productCombos =
            result.map((e) => ProductComboModel.fromJson(e)).toList();
        return productCombos;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
