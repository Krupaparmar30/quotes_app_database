
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controller/quotes_db_controller.dart';
import '../edit_page/editPage.dart';
import '../like_folder/like_folder.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final QuotesController controller = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/krishna.jpg'),
          ),
          color: Color(0xFF3B3B3D),
        ),
        child: Obx(
              () => PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.quotes.length,
            itemBuilder: (context, index) {
              final quote = controller.quotes[index];
              return Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
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
                      GestureDetector(
                        onDoubleTap: () {
                          Get.to(() => LikedQuotesScreen(), transition: Transition.downToUp);
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
                  ),
                  SizedBox(height: 200),
                  GestureDetector(
                    child: Text(
                      quote.text,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '~ ${quote.author}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          quote.liked == "1" ? Icons.favorite : Icons.favorite_border,
                          color: quote.liked == "1" ? Colors.red : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          controller.likeQuote(quote);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.copy_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                            text: '${quote.text} - ${quote.author}',
                          ));
                          Get.snackbar(
                            backgroundColor: Colors.yellow.shade100,
                            'Copied',
                            'Quote copied to clipboard',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          Share.share('${quote.text} - ${quote.author}');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit,color: Colors.white,),
                        onPressed: () {
                          Get.to(() => ThoughtScreen(
                            quote: RxString(quote.text),
                            author: RxString(quote.author),
                          ));
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

var controller = Get.put(QuotesController());
List<GlobalKey> imageKey =
    List.generate(controller.quotes.length, (index) => GlobalKey());
int SelectIndex = 0;
bool selectImg = true;
