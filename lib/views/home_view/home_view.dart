import 'package:demo_project/controllers/home_controller/home_controller.dart';
import 'package:demo_project/models/home_model/home_model.dart';
import 'package:demo_project/utils/color_picker.dart';
import 'package:demo_project/utils/constants/number_constants.dart';
import 'package:demo_project/widgets/common_buttons/outline_button_widget.dart';
import 'package:demo_project/widgets/common_progress_indicator_widget.dart';
import 'package:demo_project/widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared_preferences_initialize.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants/shared_preferences_key.dart';
import '../../utils/constants/string_constants.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: boxDecoration,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: isFalse,
            backgroundColor: kWhite,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(NumberConstants.d30),
              child: Image.network(
                  SharedPreferencesInitialize.getStringPrefValue(
                      key: SharedPreferencesKey.userProfile),
                  height: NumberConstants.d30,
                  width: NumberConstants.d30,
                  fit: BoxFit.cover),
            ).paddingAll(10),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                  fontSize: NumberConstants.d17,
                  fontWeight: FontWeight.w500,
                  text:
                      '''${SharedPreferencesInitialize.getStringPrefValue(key: SharedPreferencesKey.firstName)} ${SharedPreferencesInitialize.getStringPrefValue(key: SharedPreferencesKey.lastName)}''',
                ),
                CommonTextWidget(
                  fontSize: NumberConstants.d13,
                  color: secondaryLabelColor,
                  text: SharedPreferencesInitialize.getStringPrefValue(
                      key: SharedPreferencesKey.userEmail),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    SharedPreferencesInitialize.preference?.clear();
                    Get.offAllNamed(AppRoutes.authenticationTab);
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: primaryLabelColor,
                  ))
            ],
          ),
          body: Obx(() {
            return controller.isLoading.value
                ? const Center(child: CommonProgressIndicatorWidget())
                : Column(
                    children: [
                      ListTile(
                        title: const CommonTextWidget(
                            text: 'User list',
                            fontSize: NumberConstants.d17,
                            fontWeight: FontWeight.w500),
                        trailing: Container(
                          margin: const EdgeInsets.all(NumberConstants.d8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(NumberConstants.d8),
                              border: Border.all(
                                  width: 1, color: secondaryLabelColor)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.isGridView(isFalse);
                                },
                                icon: const Icon(Icons.list_alt,
                                    color: primary, size: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.isGridView(isTrue);
                                },
                                icon: const Icon(Icons.grid_view,
                                    color: primary, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: !controller.isGridView.value
                            ? ListView.builder(
                                controller: controller.scrollController,
                                itemCount: controller.userList.length,
                                itemBuilder: (_, index) {
                                  UserList data = controller.userList[index];
                                  return buildTileCard(data: data);
                                })
                            : GridView.builder(
                                controller: controller.scrollController,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: NumberConstants.d16),
                                itemCount: controller.userList.length,
                                itemBuilder: (_, index) {
                                  UserList data = controller.userList[index];
                                  return buildGridCard(data: data);
                                }),
                      ),
                      commonPaginationLoader(controller.isLoadingMore.value)
                    ],
                  ).paddingSymmetric(horizontal: NumberConstants.d16);
          }),
        ));
  }

  buildTileCard({required UserList data}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: secondaryLabelColor, width: .5),
          borderRadius: BorderRadius.circular(NumberConstants.d8)),
      child: ListTile(
        title: CommonTextWidget(
          text: "${data.firstName} ${data.lastName}",
          fontSize: NumberConstants.d12,
        ),
        subtitle: CommonTextWidget(
          text: "${data.email}  ${data.phoneNo}",
          fontSize: NumberConstants.d12,
        ),
        trailing: OutlineButtonWidget(
            btnName: 'View Profile',
            onPressed: () {},
            btnWidth: 80,
            btnHeight: 25),
      ),
    ).paddingSymmetric(vertical: 8);
  }

  buildGridCard({required UserList data}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: secondaryLabelColor, width: .5),
          borderRadius: BorderRadius.circular(NumberConstants.d8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget(text: "${data.firstName}"),
          CommonTextWidget(text: "${data.lastName}"),
          CommonTextWidget(text: "${data.email}"),
          CommonTextWidget(text: "${data.phoneNo}"),
          OutlineButtonWidget(
              btnName: 'View Profile',
              onPressed: () {},
              btnWidth: 80,
              btnHeight: 25)
        ],
      ).paddingOnly(left: NumberConstants.d8, top: NumberConstants.d8),
    ).paddingSymmetric(vertical: 8);
  }
}
