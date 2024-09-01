
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/quotes_db_controller.dart';
import 'like2.dart';

class likePage extends StatelessWidget {
  const likePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QuotesController());
    return Scaffold(
appBar: AppBar(
  title: Text("Favorite"),
  leading: IconButton(onPressed: () {
    Get.back();
  }, icon: Icon(Icons.arrow_back_ios)),
  
),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: controller.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,

        ),
        itemBuilder: (context, index) {
          List<String> category = controller.categories.toList();
          return GestureDetector(
            onTap: () {
              // Pass the selected category to LikeScreen
              Get.to(() => LikeScreen(category: category[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
              ),
              child: Center(
                child: Text(
                  category[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
