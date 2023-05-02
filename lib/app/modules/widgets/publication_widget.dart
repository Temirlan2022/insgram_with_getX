import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controllers/home_controller.dart';

class PublicationWidget extends StatelessWidget {
   PublicationWidget(
      {super.key, this.time, this.description, this.deleteTap, this.editTap});
  final String? time;
  final String? description;
  final void Function()? deleteTap;
  final void Function()? editTap;
   final HomeController mainScreenController =
      Get.put<HomeController>(HomeController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        const Divider(),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  child: Row(
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.pink,
                  ),
                  SizedBox(width: 8),
                  Text("adanbaev11"),
                ],
              )),
              GestureDetector(
                  onTap:deleteTap,
                  child: SizedBox(
                      height: 60,
                      width: 150,
                      child: Row(
                        children: [Icon(Icons.delete), Text('Удалить')],
                      ))),
              GestureDetector(
                  onTap: editTap,
                  child: SizedBox(
                      height: 60,
                      width: 150,
                      child: Row(
                        children: [Icon(Icons.edit), Text('Редактировать')],
                      )))
              // IconButton(
              //     onPressed: () {
              //       showCupertinoModalBottomSheet(
              //         expand: true,
              //         context: context,
              //         backgroundColor: Colors.transparent,
              //         builder: (context) => Stack(
              //           children: <Widget>[
              //             Positioned(
              //                 height: 40,
              //                 left: 40,
              //                 right: 40,
              //                 bottom: 20,
              //                 child: GestureDetector(
              //                     onTap: onTap,
              //                     child: SizedBox(
              //                         height: 60,
              //                         width: double.infinity,
              //                         child: Row(
              //                           children: [
              //                             Icon(Icons.delete),
              //                             Text('Удалить')
              //                           ],
              //                         ))))
              //           ],
              //         ),
              //       );
              //     },
              //     icon: Icon(Icons.more_vert))
            ],
          ),
        ),
        SizedBox(height: 4),
        Container(color: Colors.green, height: 200, width: double.infinity),
        Row(
          children: [Text("adanbaev11"), Text(description ?? '')],
        ),
        Text(time ?? '')
      ]),
    );
  }
}
