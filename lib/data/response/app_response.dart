import 'dart:convert';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

class AppResponse {
  dynamic returnResponse(http.Response response) {

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      // case 401:
      //   SharedPreferencesInitialize.preference?.clear();
      //   return Get.offAllNamed(AppRoutes.signInView);
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accorded while communicating with server ${response.statusCode}');
    }
  }
}

final AppResponse appResponse = AppResponse();
