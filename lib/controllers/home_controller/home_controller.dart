import 'package:demo_project/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/network/get_api_service.dart';
import '../../models/home_model/home_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants/string_constants.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getData();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (currentPage.value <= lastPage.value && !isLoadingMore.value) {
          getPaginationData(pageNo: currentPage.value);
        }
      }
    });

    super.onInit();
  }

  RxBool isLoading = isFalse.obs;
  RxBool isLoadingMore = isFalse.obs;
  RxBool isGridView = isFalse.obs;

  RxList<UserList> userList = RxList([]);

  RxInt lastPage = 0.obs;
  RxInt currentPage = 1.obs;

  getData() async {
    isLoading(isTrue);
    var response = await getApiService.getApi(getApiUrl: ApiUrls.userList);
    HomeModel homeModel = HomeModel.fromJson(response);
    if (homeModel.status == isTrue) {
      lastPage(homeModel.lastPage);

      currentPage(homeModel.currentPage);
      userList.value = homeModel.userList ?? [];
      if (currentPage.value < lastPage.value) {
        currentPage(currentPage.value + 1);
      }
      isLoading(isFalse);
    } else {
      showToast(msg: homeModel.message, bgColor: Colors.red);
      isLoading(isFalse);
    }
  }

  getPaginationData({required int pageNo}) async {
    isLoadingMore(isTrue);
    var response = await getApiService.getApi(
        getApiUrl: "${ApiUrls.userList}?page=$pageNo");
    HomeModel homeModel = HomeModel.fromJson(response);
    if (homeModel.status == isTrue) {
      currentPage(homeModel.currentPage);

      userList.addAll(homeModel.userList ?? []);
      if (currentPage.value < lastPage.value) {
        currentPage(currentPage.value + 1);
      }
      isLoadingMore(isFalse);
    } else {
      lastPage(lastPage.value + 1);
      isLoadingMore(isFalse);
    }
  }
}

class HomeControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
