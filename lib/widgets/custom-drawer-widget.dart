// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_plate/screens/auth-ui/welcome_screen.dart';
import 'package:organic_plate/screens/user-panel/all-categoris-screen.dart';
import 'package:organic_plate/screens/user-panel/all-orders-screen.dart';
import 'package:organic_plate/screens/user-panel/contact-screen.dart';
import 'package:organic_plate/screens/user-panel/user_profile.dart';
import 'package:organic_plate/utils/app_constant.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Shakya",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                subtitle: Text(
                  "I'm an organic foodie",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Color.fromARGB(255, 2, 48, 19),
                  child: Icon(
                    Icons.person,
                    color: AppConstant.appTextColor,
                    size: 30.0, 
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Profile",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.account_circle,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => ProfileScreen(userData: null,));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Home",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.home,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => WelcomeScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Products",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => AllCategoriesScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Orders",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => AllOrdersScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Contact",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.help,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => ContactScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () async {
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Logout",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 4, 124, 94),
      ),
    );
  }
}
