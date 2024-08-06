import 'package:demo_project/controllers/authentication_controller/sign_up_controller.dart';
import 'package:demo_project/extension/sized_box_extension.dart';
import 'package:demo_project/utils/constants/number_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:get/get_utils/get_utils.dart';

import '../../utils/app_utils.dart';
import '../../widgets/common_buttons/elevated_button_widget.dart';
import '../../widgets/common_text_field/common_text_field.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NumberConstants.d24.sBH,
          CommonTextField(
            errorText: controller.fNameErrorText,
            focusNode: controller.fNameFocusNode,
            textEditingController: controller.fNameCtrl,
            labelText: 'First name',
            hintText: 'enter your first name',
            inputFormatters: [alphaRegex, LengthLimitingTextInputFormatter(30)],
            onChanged: (value) {
              controller.fNameSetter(value);
            },
            textInputType: TextInputType.name,
            autofillHints: const [AutofillHints.givenName],
          ),
          NumberConstants.d24.sBH,
          CommonTextField(
              errorText: controller.lNameErrorText,
              focusNode: controller.lNameFocusNode,
              textEditingController: controller.lNameCtrl,
              labelText: 'Last name',
              hintText: 'enter your last name',
              inputFormatters: [
                alphaRegex,
                LengthLimitingTextInputFormatter(30)
              ],
              onChanged: (value) {
                controller.lNameSetter(value);
              },
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.familyName]),
          NumberConstants.d24.sBH,
          CommonTextField(
            errorText: controller.phoneErrorText,
            focusNode: controller.phoneFocusNode,
            textEditingController: controller.phoneCtrl,
            labelText: 'Phone',
            hintText: 'enter your phone',
            onChanged: (value) {
              controller.phoneSetter(value);
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10)
            ],
            textInputType: TextInputType.phone,
            autofillHints: const [
              AutofillHints.telephoneNumberDevice,
              AutofillHints.telephoneNumber,
              AutofillHints.telephoneNumberLocal,
              AutofillHints.telephoneNumberNational
            ],
          ),
          NumberConstants.d24.sBH,
          CommonTextField(
            errorText: controller.emailErrorText,
            focusNode: controller.emailFocusNode,
            textEditingController: controller.emailCtrl,
            labelText: 'E-mail',
            hintText: 'enter your email',
            onChanged: (value) {
              controller.emailSetter(value);
            },
            textInputType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
          ),
          NumberConstants.d24.sBH,
          Obx(() {
            return CommonTextField(
              focusNode: controller.passwordFocusNode,
              textEditingController: controller.passCtrl,
              labelText: 'Password',
              hintText: 'enter your password',
              onChanged: (value) {
                controller.passwordSetter(value);
              },
              errorText: controller.passwordErrorText,
              textInputType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.newPassword],
              obscureText: controller.isShowPassword.value,
              suffixIcon: IconButton(
                iconSize: NumberConstants.d16,
                onPressed: () {
                  controller.isShowPassword(!controller.isShowPassword.value);
                },
                icon: controller.isShowPassword.value
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            );
          }),
          NumberConstants.d24.sBH,
          Obx(() {
            return CommonTextField(
              focusNode: controller.confirmPasswordFocusNode,
              textEditingController: controller.confirmPassCtrl,
              labelText: 'Confirm password',
              hintText: 'enter your confirm password',
              onChanged: (value) {
                controller.confirmPasswordSetter(value);
              },
              errorText: controller.confirmPasswordErrorText,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.newPassword],
              obscureText: controller.isShowConfirmPassword.value,
              suffixIcon: IconButton(
                iconSize: NumberConstants.d16,
                onPressed: () {
                  controller.isShowConfirmPassword(
                      !controller.isShowConfirmPassword.value);
                },
                icon: controller.isShowConfirmPassword.value
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            );
          }),
          NumberConstants.d24.sBH,
          Obx(() {
            return ElevatedButtonWidget(
                isLoading: controller.isSignUpLoading.value,
                onPressed: () {
                  controller.validationChecker();
                },
                btnName: 'Sign Up');
          }),
        ],
      ).paddingSymmetric(horizontal: NumberConstants.d16),
    );
  }
}
