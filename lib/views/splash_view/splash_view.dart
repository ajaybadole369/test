import 'package:demo_project/widgets/common_progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/splash_controller/splash_controller.dart';
import '../../utils/color_picker.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Container(
      decoration: boxDecoration,
      child: const Scaffold(
        body: Center(
          child: CommonProgressIndicatorWidget(color: primaryLabelColor),
        ),
      ),
    );
  }
}
