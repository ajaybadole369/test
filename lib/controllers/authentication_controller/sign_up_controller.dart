import 'package:demo_project/data/network/post_api_service.dart';
import 'package:demo_project/utils/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/authentication_model/sign_in_model.dart';
import '../../shared_preferences_initialize.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/shared_preferences_key.dart';

class SignUpController extends GetxController {
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();
  FocusNode fNameFocusNode = FocusNode();
  FocusNode lNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  // NAME VERIFICATION

  RxString fNameChecker = StringConstants.empty.obs;

  fNameSetter(value) {
    fNameChecker.value = value;
  }

  String? get fNameErrorText {
    final text = fNameChecker.value;

    if (text.isEmpty && fNameFocusNode.hasFocus) {
      return 'Can\'t be empty';
    } else if (fNameFocusNode.hasFocus) {
      return null;
    }
    return null;
  }

  RxString lNameChecker = StringConstants.empty.obs;

  lNameSetter(value) {
    lNameChecker.value = value;
  }

  String? get lNameErrorText {
    final text = lNameChecker.value;

    if (text.isEmpty && fNameFocusNode.hasFocus) {
      return 'Can\'t be empty';
    } else if (fNameFocusNode.hasFocus) {
      return null;
    }
    return null;
  }

  // PHONE VERIFICATION

  RxString phoneChecker = StringConstants.empty.obs;

  phoneSetter(value) {
    phoneChecker.value = value;
  }

  String? get phoneErrorText {
    final text = phoneChecker.value;

    if (text.isEmpty && phoneFocusNode.hasFocus) {
      return 'Please enter mobile number';
    } else if ((text.length != 10 && phoneFocusNode.hasFocus)) {
      return 'Please enter valid mobile number';
    } else if (phoneFocusNode.hasFocus) {
      return null;
    }
    return null;
  }

  // EMAIL VERIFICATION

  RxString emailChecker = StringConstants.empty.obs;

  emailSetter(value) {
    emailChecker.value = value;
  }

  String? get emailErrorText {
    final text = emailChecker.value;

    if (text.isEmpty && emailFocusNode.hasFocus) {
      return 'Please enter email address';
    } else if (validateEmailStructure(text) == isFalse &&
        emailFocusNode.hasFocus) {
      return 'Please enter valid email address';
    } else if (emailFocusNode.hasFocus) {
      return null;
    }
    return null;
  }

  // PASSWORD VERIFICATION

  RxString passwordChecker = StringConstants.empty.obs;

  passwordSetter(value) {
    passwordChecker.value = value;
  }

  String? get passwordErrorText {
    final text = passwordChecker.value;

    if (text.isEmpty && passwordFocusNode.hasFocus) {
      return 'Can\'t be empty';
    } else if (text.length < 8 && passwordFocusNode.hasFocus) {
      return 'Too short';
    } else if (passwordFocusNode.hasFocus) {
      return null;
    }
    return null;
  }

  // confirm password
  RxString confirmPasswordChecker = StringConstants.empty.obs;

  confirmPasswordSetter(value) {
    confirmPasswordChecker.value = value;
  }

  String? get confirmPasswordErrorText {
    final text = confirmPasswordChecker.value;

    if (text.isEmpty && confirmPasswordFocusNode.hasFocus) {
      return 'Can\'t be empty';
    }

    if (confirmPasswordFocusNode.hasFocus &&
        (passwordChecker.value != confirmPasswordChecker.value)) {
      return 'Confirm password is not same as password';
    }
    return null;
  }

  validationChecker() {
    if (fNameChecker.value == StringConstants.empty) {
      fNameFocusNode.requestFocus();
    } else if (lNameChecker.value == StringConstants.empty) {
      lNameFocusNode.requestFocus();
    } else if (10 != phoneChecker.value.length) {
      phoneFocusNode.requestFocus();
    } else if (validateEmailStructure(emailChecker.value) == isFalse) {
      emailFocusNode.requestFocus();
    } else if (passwordChecker.value.length < 8) {
      passwordFocusNode.requestFocus();
    } else if (passwordChecker.value != confirmPasswordChecker.value) {
      confirmPasswordFocusNode.requestFocus();
    } else {
      signUp();
    }
  }

  RxBool isSignUpLoading = isFalse.obs;

  // SHOW HIDE PASSWORD
  RxBool isShowPassword = isTrue.obs;
  RxBool isShowConfirmPassword = isTrue.obs;

  signUp() async {
    Map<String, dynamic> body = {
      "first_name": fNameChecker.value,
      "last_name": lNameChecker.value,
      "country_code": "+91",
      "phone_no": phoneCtrl.text,
      "email": emailChecker.value,
      "password": passwordChecker.value,
      "confirm_password": passwordChecker.value
    };
    isSignUpLoading(isTrue);
    await postApiService
        .postApi(postApiUrl: 'userRegister', body: body)
        .then((value) {
      SignInModel model = SignInModel.fromJson(value);

      if (model.status == isTrue) {
        showToast(msg: model.message, bgColor: Colors.green);
        isSignUpLoading(isFalse);
        Get.offAllNamed(AppRoutes.authenticationTab);
      } else {
        showToast(msg: model.message, bgColor: Colors.red);
        isSignUpLoading(isFalse);
      }
    }).catchError((onError) {
      isSignUpLoading(isFalse);
    });
  }

  @override
  void dispose() {
    fNameCtrl.dispose();
    lNameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    confirmPassCtrl.dispose();
    super.dispose();
  }
}

class SignUpControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
