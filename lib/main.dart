import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes_app_database/view/quotes_pages/homePage/homePage.dart';
import 'package:quotes_app_database/view/quotes_pages/splesh_page/spaesh_page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:() => SplashScreen(),)
      ],
    );
  }
}
