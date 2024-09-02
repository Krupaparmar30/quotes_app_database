
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/quotes_db_controller.dart';
import '../../../modal/quotes_db_modal.dart';

class QuotesDetailScreen extends StatelessWidget {
  final String category;
  final List<Quote> quotes;

  const QuotesDetailScreen(
      {super.key, required this.category, required this.quotes});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QuotesController());

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/krishna.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Positioned.fill(
            child: Column(
              children: [
                // Top section with title and back icon
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(width: 10),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      var quote = quotes[index];
                      var quoteIndex = controller.favoriteQuotes.indexOf(quote);
                      return Card(
                        elevation: 2, // Add shadow here
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text(
                            quote.text,
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text('- ${quote.author}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              //   controller.(quote, quoteIndex);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
