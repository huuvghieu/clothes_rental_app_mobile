import 'dart:convert';

import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:clothes_rental_mobile/services/network_handler.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  static String endpoint = '${AppString.baseURL}orders';
  static String? token;
  static CreateOrderModel? orderModel;

  Future<bool> createOrder(CreateOrderModel createOrderModel) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };

      Map body = {
        'shopId': createOrderModel.shopId,
        'note': createOrderModel.note,
        'orderDetails': createOrderModel.orderDetails,
      };

      http.Response response = await http.post(Uri.parse(endpoint),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        print('Create Success!');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
