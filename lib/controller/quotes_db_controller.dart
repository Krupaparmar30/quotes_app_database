import 'package:get/get.dart';

import 'package:quotes_app_database/helper/quotes_db_helper.dart';
import 'package:quotes_app_database/modal/quotes_db_modal.dart';
import 'package:sqflite/sqflite.dart';

class QuotesDbController extends GetxController {
  late QuotesDbModal quotesDbModal;
  RxList ListData = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    initDd();

  }

  Future<void> initDd() async {
    await QuotesDbHelper.dbHelper.database;
  }

  Future<RxList> getData()
  async {
    allData();
    ListData.value=await QuotesDbHelper.dbHelper.readData();
    return ListData;
  }

  Future<void> allData() async {
    final data = await QuotesDbHelper.dbHelper.apiFetchData();
    quotesDbModal = QuotesDbModal.fromMap(data!);
    for (int i = 0; i < quotesDbModal.quote.length; i++) {
      QuotesDbHelper.dbHelper.insertData(
          quotesDbModal.quote[i].category,
          quotesDbModal.quote[i].quote,
          quotesDbModal.quote[i].author,
          quotesDbModal.quote[i].description);
    }
  }
}

