import 'package:clone_instagram/app/app_constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_constants/text_styles.dart';
import '../../widgets/bottom_navigation_menu_widget.dart';
import '../../widgets/publication_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  //final HomeController homeScreenController =
  //     Get.put<HomeController>(HomeController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (homeScreenController) {
          homeScreenController.getData();
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            bottomNavigationBar: buildBottomNavigationMenu(context),
            body: homeScreenController.isLoading
                ? Center(child: CircularProgressIndicator())
                : Obx(() => SafeArea(
                      child: IndexedStack(
                        index: homeScreenController.tabIndex.value,
                        children: [
                          MainScreen(),
                          Container(
                            color: Colors.red,
                          ),
                          AddPublicationScreen(),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )),
          );
        });
  }
}

class MainScreen extends GetView {
  MainScreen({
    super.key,
  });
  final HomeController mainScreenController =
      Get.put<HomeController>(HomeController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Instagram', style: TextStyles.cabin24w600),
        SizedBox(
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Icon(
                Icons.favorite_border,
                color: AppColors.blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.message,
                color: AppColors.blackColor,
              ),
            )
          ]),
        )
      ]),
      const SizedBox(height: 15.0),
      SizedBox(
        height: 80.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 77,
              height: 80,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.yellow,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text('adanbaev11'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Obx(() => SizedBox(
            width: double.infinity,
            height: Get.height - 240,
            child: ListView.builder(
                reverse: true,
                itemCount: mainScreenController.publications.length,
                itemBuilder: (context, index) => PublicationWidget(
                    deleteTap: () {
                      mainScreenController.deletePublication(
                          mainScreenController.publications[index]);
                    },
                    time: mainScreenController.publications[index].publicTime,
                    description:
                        mainScreenController.publications[index].description,
                    editTap: () {})),
          ))
    ]));
  }
}

class AddPublicationScreen extends GetView {
  AddPublicationScreen({
    super.key,
  });
  final HomeController addPublicationScrennController =
      Get.put<HomeController>(HomeController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            Text("Новая публикация", style: TextStyle(color: Colors.black)),
            IconButton(
                onPressed: () async {
                  await addPublicationScrennController.addPublication(
                      DateTime.now(), false, '');
                },
                icon: const Icon(
                  Icons.check_outlined,
                  color: Colors.blue,
                ))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(radius: 22, backgroundColor: Colors.purple),
              SizedBox(
                width: Get.width - 200,
                child: TextField(
                  controller:
                      addPublicationScrennController.textEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Добавьте надпись"),
                ),
              ),
              Container(height: 55, width: 55, color: Colors.blue)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Divider(),
        )
      ]),
    );
  }
}
