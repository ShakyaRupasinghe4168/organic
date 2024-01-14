// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_plate/screens/auth-ui/welcome_screen.dart';
import '../../utils/app_constant.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
       
        backgroundColor: AppConstant.appMainColor,
      title: Text(
          "Welcome to ORGANIC PLATE",
          style: TextStyle(color: AppConstant.appTextColor,
          fontWeight: FontWeight.bold,),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/welcome_image.jpg',
                  width: Get.width / 1,
                  height: Get.height / 2, 
                  fit: BoxFit.cover, 
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Green Shopping - Healthy Life",
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
                height: Get.height / 60, 
              ),
             
              SizedBox(
                height: Get.height / 60, 
              ),
              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 8, 175, 125),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                 child: TextButton(
                      child: Text(
                        "START",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                    onPressed: () {
                      Get.to(() => WelcomeScreen());
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
