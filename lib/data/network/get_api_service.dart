import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../shared_preferences_initialize.dart';
import '../../utils/constants/api_urls.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/shared_preferences_key.dart';
import '../../utils/constants/string_constants.dart';
import '../response/app_exception.dart';
import '../response/app_response.dart';

class GetApiService {
  getApi({required String getApiUrl, bool isToken = isTrue}) async {
    String token = SharedPreferencesInitialize.getStringPrefValue(
        key: SharedPreferencesKey.authToken);
    if (kDebugMode) {
      print("GET API URL-: ${ApiUrls.baseUrl}$getApiUrl");
      print("BEARER  $token \n ---END TOKEN--- \n \n ");
    }

    //headers
    Map<String, String> headers = {
      ApiUrls.contentType: ApiUrls.applicationJson,
      ApiUrls.accept: ApiUrls.applicationJson,
    };
    if (isToken) {
      headers[ApiUrls.authorization] = "${ApiUrls.bearer} $token";
    }

    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse("${ApiUrls.baseUrl}$getApiUrl"), headers: headers)
          .timeout(const Duration(seconds: NumberConstants.i300));
      responseJson = appResponse.returnResponse(response);
    } on SocketException {
      throw InternetException(StringConstants.empty);
    } on RequestTimeOut {
      throw RequestTimeOut(StringConstants.empty);
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }
}

final GetApiService getApiService = GetApiService();
