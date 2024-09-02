
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_database/view/quotes_pages/homePage/homePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(onTap: () {
        Get.to(() => HomePage());
      },
        child: Container(
          height:900,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xff131a24),
              image: DecorationImage(image: AssetImage('assets/images/qu.png'),fit: BoxFit.fitWidth)
          ),
        ),
      ),
    );
  }
}
