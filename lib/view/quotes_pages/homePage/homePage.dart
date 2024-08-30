import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/quotes_db_controller.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QuotesDbController());
    return Scaffold(


        // body: Container(
        //   padding: const EdgeInsets.all(40),
        //
        //   child: Obx(
        //         () =>
        //             PageView.builder(
        //               scrollDirection: Axis.vertical,
        //               itemCount: controller.ListData.length,
        //               itemBuilder: (context, index) => Column(children: [
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 SelectableText(
        //                   controller.ListData[index]['quote'],
        //
        //
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ],)
        //             )
        //
        //   ),
        // ),
        body: Container(
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://e0.pxfuel.com/wallpapers/881/424/desktop-wallpaper-harekrishna-mandir-dark-krishna.jpg')),
              color: Color(0xFF3B3B3D)),
          child: Obx(
            () => PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.ListData.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.ListData[index]['quote'],style: TextStyle(color: Colors.white,fontSize: 25),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('~ ${controller.ListData[index]['author']}',style: TextStyle(color: Colors.white,fontSize: 25),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
