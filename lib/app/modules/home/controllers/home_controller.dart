import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/publication_model.dart';

class HomeController extends GetxController {
  var isLoading = false;
  var tabIndex = 0.obs;
  final publications = <PublicationModel>[].obs;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.clear();
    super.dispose();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Future<void> addPublication(DateTime time, bool done, String id) async {
    // String desc = textEditingController!.text;
    // DateTime publicTime = DateTime.now();
    // publications.add(PublicationModel(desc, publicTime.toString()));
    await FirebaseFirestore.instance
        .collection('publication')
        .doc(id != '' ? id : null)
        .set({
      'publicTime': time,
      'description': textEditingController.text,
      'isdone': done
    }, SetOptions(merge: true));
  }

  void deletePublication(PublicationModel publication) {
    publications.remove(publication);
  }

  Future<void> getData() async {
    try {
      QuerySnapshot _publicationSnap = await FirebaseFirestore.instance
          .collection("publication")
          .orderBy("description")
          .get();
      for (var item in _publicationSnap.docs) {
        publications.add(PublicationModel(item.id, item["description"],
            item["publicTime"], item["isCompleted"]));
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
