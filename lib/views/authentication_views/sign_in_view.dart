import 'package:demo_project/controllers/authentication_controller/sign_in_controller.dart';
import 'package:demo_project/extension/sized_box_extension.dart';
import 'package:demo_project/utils/color_picker.dart';
import 'package:demo_project/utils/constants/number_constants.dart';
import 'package:demo_project/utils/constants/string_constants.dart';
import 'package:demo_project/widgets/common_buttons/elevated_button_widget.dart';
import 'package:demo_project/widgets/common_buttons/text_button_widget.dart';
import 'package:demo_project/widgets/common_text_field/common_text_field.dart';
import 'package:demo_project/widgets/common_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common_divider_widget.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NumberConstants.d24.sBH,
          CommonTextField(
              textEditingController: controller.emailCtrl,
              labelText: 'E-mail',
              hintText: 'enter your email'),
          NumberConstants.d24.sBH,
          CommonTextField(
            labelText: 'Password',
            hintText: 'enter your password',
            textEditingController: controller.passCtrl,
          ),
          NumberConstants.d24.sBH,
          Obx(() {
            return ElevatedButtonWidget(
                isLoading: controller.isLoading.value,
                onPressed: () {
                  controller.signInCall();
                },
                btnName: 'Login');
          }),
          Align(
              alignment: Alignment.centerRight,
              child: TextButtonWidget(
                  onPressed: () {}, btnName: 'Forgot Password?')),
          NumberConstants.d24.sBH,
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: CommonDividerWidget(
                      color: primaryLabelColor,
                      thickness: NumberConstants.d1,
                      endIndent: NumberConstants.d20)),
              CommonTextWidget(text: 'Or signin with'),
              Expanded(
                  child: CommonDividerWidget(
                      color: primaryLabelColor,
                      thickness: NumberConstants.d1,
                      indent: NumberConstants.d20)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildLogoImage(fileName: 'assets/images/facebook.png'),
              buildLogoImage(fileName: 'assets/images/google.png'),
              buildLogoImage(fileName: 'assets/images/apple.png'),
            ],
          ).paddingSymmetric(vertical: NumberConstants.d24),
          RichText(
                  text: TextSpan(
                      children: [
                const TextSpan(text: 'Don’t have a Account? '),
                TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(color: primary),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ],
                      style: const TextStyle(
                          fontFamily: StringConstants.fontFamily,
                          color: secondaryLabelColor,
                          fontSize: NumberConstants.d16,
                          fontWeight: FontWeight.w500)))
              .paddingOnly(top: NumberConstants.d16),
        ],
      ).paddingSymmetric(horizontal: NumberConstants.d16),
    );
  }

  buildLogoImage({required String fileName}) {
    return Image.asset(
      fileName,
      height: NumberConstants.d25,
      width: NumberConstants.d25,
    );
  }
}
