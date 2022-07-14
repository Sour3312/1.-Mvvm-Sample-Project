// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;

import 'package:mvvm_with_map/data/app_exception.dart';
import 'package:mvvm_with_map/data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await https.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection!");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      https.Response response = await https
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection!");
    }
    return responseJson;
  }

  dynamic returnResponse(https.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 300:
        throw InvalidInputException(response.body.toString());

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code ${response.statusCode.toString()}}");
    }
  }
}
