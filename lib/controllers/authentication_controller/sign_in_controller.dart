import 'package:demo_project/utils/app_routes.dart';
import 'package:demo_project/utils/app_utils.dart';
import 'package:demo_project/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/network/post_api_service.dart';
import '../../models/authentication_model/sign_in_model.dart';
import '../../shared_preferences_initialize.dart';
import '../../utils/constants/shared_preferences_key.dart';
import '../../utils/constants/string_constants.dart';

class SignInController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  RxBool isLoading = isFalse.obs;

  signInCall() async {
    Map<String, dynamic> body = {
      "email": emailCtrl.text,
      "password": passCtrl.text
    };
    isLoading(isTrue);
    var response =
        await postApiService.postApi(postApiUrl: ApiUrls.userLogin, body: body);
    SignInModel model = SignInModel.fromJson(response);

    if (model.status == isTrue) {
      SharedPreferencesInitialize.setStringPrefValue(
          key: SharedPreferencesKey.authToken,
          value: model.record?.authtoken ?? StringConstants.empty);    SharedPreferencesInitialize.setStringPrefValue(
          key: SharedPreferencesKey.firstName,
          value: model.record?.firstName ?? StringConstants.empty);
      SharedPreferencesInitialize.setStringPrefValue(
          key: SharedPreferencesKey.lastName,
          value: model.record?.lastName ?? StringConstants.empty);
      SharedPreferencesInitialize.setStringPrefValue(
          key: SharedPreferencesKey.userProfile,
          value: model.record?.profileImg ?? StringConstants.empty);
      SharedPreferencesInitialize.setStringPrefValue(
          key: SharedPreferencesKey.userEmail,
          value: model.record?.email ?? StringConstants.empty);
      showToast(msg: model.message, bgColor: Colors.green);
      isLoading(isFalse);
      Get.offAllNamed(AppRoutes.homeView);
    } else {
      showToast(msg: model.message, bgColor: Colors.red);
      isLoading(isFalse);
    }
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }
}

class SignInControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
