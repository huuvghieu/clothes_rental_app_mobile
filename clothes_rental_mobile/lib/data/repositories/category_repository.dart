import 'dart:convert';

import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  static String endpoint = '${AppString.baseURL}categories';
  static String? token;
  static List<CategoryModel>? cateModels;

  Future<List<CategoryModel>?> getCategories() async {
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
        cateModels = result.map((e) => CategoryModel.fromJson(e)).toList();
        return cateModels;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
