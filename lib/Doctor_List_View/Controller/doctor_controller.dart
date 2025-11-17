import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Doctor_List_View/Service/doctor_service.dart';

import '../Model/doctor_model.dart';

class DoctorController extends GetxController {
  DoctorService doctorService = DoctorService();

  RxList? doctors = <Doctor>[].obs;
  Rx<Pagination?> pagination = Rx<Pagination?>(null);

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;

  RxBool hasNextPage = false.obs;

  RxInt currentPage = 0.obs;
  RxInt pageSize = 10.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
    // setupScrollListener();
    scrollController.addListener(setupScrollListener);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadInitialData({bool? isPaginating = false}) async {

    if (isPaginating == true) {
      isLoadingMore.value = true;
    } else {
      isLoading.value = true;
    }
    try {
      final response = await doctorService.fetchDoctors(
        page: currentPage.value,
        size: pageSize.value,
      );

      if (response.statusCode == 200) {

        hasNextPage.value = response.data.pagination.hasNext;

        if (isPaginating == true) {
          doctors?.value.addAll(response.data.doctors);
        } else {
          doctors?.value = response.data.doctors;
        }


        isLoadingMore.value = false;
        isLoading.value = false;

      } else {
        log("empty data");
      }

    } catch (err) {
      log("what error is this ${err.toString()}");
      Get.snackbar(
        'Error',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> loadMore() async {
  //   if (!canLoadMore) {
  //     return;
  //   }
  //   isLoadingMore.value = true;
  //   try {
  //     final nextPage = currentPage.value + 1;
  //     final response = await doctorService.fetchDoctors(
  //       page: nextPage,
  //       size: pageSize.value,
  //     );
  //     doctors.addAll(response.data.doctors);
  //     pagination.value = response.data.pagination;
  //     currentPage.value = nextPage;
  //   } catch (err) {
  //     Get.snackbar(
  //       'Failed to load more doctors',
  //       err.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.orange,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> refreshData() async {
    await loadInitialData();
  }

  void retryLoading() {
    loadInitialData();
  }

  void setupScrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (!isLoadingMore.value) {
        if (hasNextPage.value) {
          currentPage.value++;
          loadInitialData(isPaginating: true);
        }
      }
    }

  }
}
