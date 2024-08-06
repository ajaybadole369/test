import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/api_urls.dart';
import '../../utils/constants/string_constants.dart';
import '../response/app_exception.dart';
import '../response/app_response.dart';

class PostApiService {
  Future<dynamic> postApi(
      {dynamic body, required String postApiUrl, bool isToken = isTrue}) async {
    String token = '';
    // SharedPreferencesInitialize.getStringPrefValue(
    //     key: SharedPreferencesKey.userAccessToken);

    if (kDebugMode) {
      print("POST API URL-: ${ApiUrls.baseUrl}$postApiUrl");
      print("BEARER-: $token \n ---END TOKEN--- \n \n ");
      print("BODY-: $body ");
    }
    //headers
    Map<String, String> headers = {
      ApiUrls.contentType: ApiUrls.applicationJson,
      ApiUrls.accept: ApiUrls.applicationJson,
    };
    // if (isToken) {
    //   headers[ApiUrls.authorization] = "${ApiUrls.bearer} $token";
    // }

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse("${ApiUrls.baseUrl}$postApiUrl"),
              body: jsonEncode(body), headers: headers)
          .timeout(const Duration(seconds: 300));
      responseJson = appResponse.returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }
}

final PostApiService postApiService = PostApiService();
