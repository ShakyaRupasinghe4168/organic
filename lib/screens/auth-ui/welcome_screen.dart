// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_plate/screens/auth-ui/sign_in_screen.dart';
import '../../utils/app_constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppConstant.appTextColor,
        ),
        backgroundColor: Color.fromARGB(255, 2, 107, 55),
       
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/welcome.jpg',
                  width: Get.width / 1,
                  height: Get.height / 2, 
                  fit: BoxFit.cover, 
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Sign-In and Start Shopping with Us",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0), 
                child: Text(
                  "Discover a world of organic and sustainable products",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                
              ),
              SizedBox(
                height: Get.height / 50, 
              ),
              
              SizedBox(
                height: Get.height / 50, 
              ),
              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 8, 175, 125),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.email,
                      color: AppConstant.appTextColor,
                    ),
                    label: Text(
                      "Continue with Email",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {
                      Get.to(() => SignInScreen());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
