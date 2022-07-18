import 'dart:convert';

import 'package:mvvm_with_map/data/network/BaseApiServices.dart';
import 'package:mvvm_with_map/data/network/NetworkApiServices.dart';
import 'package:mvvm_with_map/resources/components/app_url.dart';
import 'package:http/http.dart' as https;

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      // https.Response response = await https
      //     .post(Uri.parse("url"), body: "data")
      //     .timeout(Duration(seconds: 10));
// var data = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   return data;
      // } else if (response.statusCode == 300) {
      //   return data;
      // }

      // ++++++++ itni lines ke bajaye 2 lines me hamara kaam ho gya +++++++++
      dynamic respon =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return respon;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registarApi(dynamic data) async {
    try {
      //  https.Response response = await https
      //     .post(Uri.parse("url"), body: "data")
      //     .timeout(Duration(seconds: 10));
// var data = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   return data;
      // } else if (response.statusCode == 300) {
      //   return data;
      // }

      // ++++++++ itni lines ke bajaye 2 lines me hamara kaam ho gya +++++++++

      dynamic respon =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return respon;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> responseApi(dynamic data) async {
    try {
      //  https.Response response = await https
      //     .post(Uri.parse("url"), body: "data")
      //     .timeout(Duration(seconds: 10));
// var data = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   return data;
      // } else if (response.statusCode == 300) {
      //   return data;
      // }

      // ++++++++ itni lines ke bajaye 2 lines me hamara kaam ho gya +++++++++

      dynamic respon =
          await _apiServices.getPostApiResponse(AppUrl.responseEndPoint, data);
      return respon;
    } catch (e) {
      rethrow;
    }
  }
}
