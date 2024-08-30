import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes_app_database/view/quotes_pages/homePage/homePage.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page:() => homePage(),)
      ],
    );
  }
}
