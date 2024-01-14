// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, avoid_unnecessary_containers

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:organic_plate/controllers/get_user_data_controller.dart';
import 'package:organic_plate/screens/admin-panel/admin_main_screen.dart';
import 'package:organic_plate/screens/auth-ui/start_screen.dart';
import 'package:organic_plate/screens/user-panel/main_screen.dart';
import 'package:organic_plate/utils/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      loggdin(context);
    });
  }

 Future<void> loggdin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());
      } else {
        Get.offAll(() => MainScreen());
      }
    } else {
      Get.to(() => StartScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  Color.fromARGB(255, 2, 63, 40),
                         
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 2, 63, 40),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash1.json'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                  color: AppConstant.appTextColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
