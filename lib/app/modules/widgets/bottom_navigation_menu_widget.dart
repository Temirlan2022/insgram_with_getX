import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_constants/colors.dart';
import '../home/controllers/home_controller.dart';

buildBottomNavigationMenu(context) {
  final HomeController homeScreenController =
      Get.put<HomeController>(HomeController(), permanent: false);
  return Container(
    decoration: const BoxDecoration(
      // color: AppColors.mainColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18), topRight: Radius.circular(18)),
    ),
    height: 80,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BottomNavigationBar(
        elevation: 0.0,
        onTap: homeScreenController.changeTabIndex,
        backgroundColor: Colors.black,
        // Get.isDarkMode ? AppColors.blackColor : AppColors.whiteColor,
        unselectedItemColor: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.5),
        selectedItemColor: Color.fromARGB(255, 206, 185, 185),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Icon(
                  Icons.home_outlined,
                  color: AppColors.blackColor,
                  //  homeScreenController.tabIndex.value == 0
                  //     ? AppColors.blackColor
                  //     : AppColors.whiteColor,
                  size: 35.0,
                ),
              ),
            ),
            label: '',
            backgroundColor: AppColors.whiteColor,
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.search,
                color: AppColors.blackColor,
                //  homeScreenController.tabIndex.value == 1
                //     ? AppColors.blackColor
                //     : AppColors.whiteColor,
                size: 35.0,
              ),
            ),
            label: '',
            backgroundColor: AppColors.whiteColor,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: AppColors.blackColor,
                  size: 35.0,
                ),
              ),
            ),
            label: '',
            backgroundColor: AppColors.whiteColor,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Icon(
                  Icons.video_settings_outlined,
                  color: AppColors.blackColor,
                  // homeScreenController.tabIndex.value == 3
                  //     ? AppColors.blackColor
                  //     : AppColors.whiteColor,
                  size: 35.0,
                ),
              ),
            ),
            label: '',
            backgroundColor: AppColors.whiteColor,
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.person_outlined,
                color: AppColors.blackColor,
                // homeScreenController.tabIndex.value == 4
                //     ? AppColors.blackColor
                //     : AppColors.whiteColor,
                size: 35.0,
              ),
            ),
            label: '',
            backgroundColor: AppColors.whiteColor,
          ),
        ],
      ),
    ),
  );
}
