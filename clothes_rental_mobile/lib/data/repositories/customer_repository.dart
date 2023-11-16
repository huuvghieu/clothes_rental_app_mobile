import 'dart:convert';
import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/data/models/order_customer_mode.dart';
import 'package:clothes_rental_mobile/services/network_handler.dart';
import 'package:http/http.dart' as http;

class CustomerRepository {
  static String endpoint = '${AppString.baseURL}customers';
  static String? token;
  static String? id;
  static List<OrderCustomerModel>? orderCustomers;

  Future<List<OrderCustomerModel>?> getOrderofCustomer() async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      id = await NetWorkHandler.storage.read(key: 'customerId');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http
          .get(Uri.parse('$endpoint/$id/orders'), headers: headers);

      if (response.statusCode == 200) {
        final List result = jsonDecode(utf8.decode(response.bodyBytes));
        orderCustomers =
            result.map((e) => OrderCustomerModel.fromJson(e)).toList();
        return orderCustomers;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
