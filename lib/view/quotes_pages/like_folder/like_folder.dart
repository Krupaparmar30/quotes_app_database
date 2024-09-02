
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_database/modal/quotes_db_modal.dart';

import '../../../controller/quotes_db_controller.dart';
import 'like2.dart';

class LikedQuotesScreen extends StatelessWidget {
  const LikedQuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QuotesController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite Quotes',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 16),
                const Text(
                  'See your favourite quotes for category wise',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Obx(() {
                    if (controller.favoriteQuotes.isEmpty) {
                      return const Center(
                        child: Text(
                          'No favourite quotes added yet.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      );
                    }

                    // Group quotes by category
                    Map<String, List<Quote>> groupedQuotes = {};
                    for (var quote in controller.favoriteQuotes) {
                      if (groupedQuotes.containsKey(quote.cate)) {
                        groupedQuotes[quote.cate]!.add(quote);
                      } else {
                        groupedQuotes[quote.cate] = [quote];
                      }
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: groupedQuotes.keys.length,
                      itemBuilder: (context, index) {
                        String category = groupedQuotes.keys.elementAt(index);
                        List<Quote> quotes = groupedQuotes[category]!;
                        return Column(
                          children: [
                            GestureDetector(
                              child: GestureDetector(
                                onDoubleTap: () {
                                  Get.to(QuotesDetailScreen(
                                      category: category, quotes: quotes));
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Center(
                                        child: Text(
                                          category,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String Family = 'friendship';
