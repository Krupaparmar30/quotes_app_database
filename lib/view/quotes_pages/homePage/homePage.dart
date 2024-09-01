import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controller/quotes_db_controller.dart';
import '../like_folder/like_folder.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QuotesController());
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/krishna.jpg')),
          color: Color(0xFF3B3B3D)),
      child: Obx(
        () => PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.quotes.length,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            CupertinoIcons.rectangle_grid_2x2_fill,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'All',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onDoubleTap: () {
                          Get.to(likePage(), transition: Transition.downToUp);
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Icon(
                            Icons.favorite_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 280,
              ),
              GestureDetector(
                // onDoubleTap: () {
                //   Get.to((quote: RxString(quote.quote),author: RxString(quote.author),));
                //
                // },
                child: Text(
                  controller.quotes[index].text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '~ ${controller.quotes[index].author}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.save_alt,
                        color: Colors.white,
                        size: 32,
                      )),
                  IconButton(
                    icon: Icon(
                      controller.quotes[index].liked == "1"
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.quotes[index].liked == "1"
                          ? Colors.red
                          : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      controller.likeQuote(controller.quotes[index]);
                    },
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 32,
                      )),
                  IconButton(
                      icon: Icon(
                        Icons.copy_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text:
                                '${controller.quotes[index].text} - ${controller.quotes[index].author}'));
                        Get.snackbar(
                          backgroundColor: Colors.yellow.shade100,
                          'Copied',
                          'Quote copied to clipboard',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
