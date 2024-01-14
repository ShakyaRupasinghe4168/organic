// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_plate/screens/user-panel/all-categoris-screen.dart';
import 'package:organic_plate/screens/user-panel/all-flash-sale-products.dart';
import 'package:organic_plate/screens/user-panel/all-recipes-Screen.dart';
import 'package:organic_plate/screens/user-panel/product-search.dart';
import 'package:organic_plate/utils/app_constant.dart';
import 'package:organic_plate/widgets/banner-widgets.dart';
import 'package:organic_plate/widgets/bottom_navigate.dart';
import 'package:organic_plate/widgets/category-widget.dart';
import 'package:organic_plate/widgets/custom-drawer-widget.dart';
import 'package:organic_plate/widgets/flash-sale-widget.dart';
import 'package:organic_plate/widgets/heading-widget.dart';
import 'package:organic_plate/widgets/recipy-widget.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          " ORGANIC PLATE",
          style: TextStyle(
            color: AppConstant.appTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ), 

      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 110.0,
              ),
              // banners
              BannerWidget(),

              // heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your choices",
                buttonText: "See More >",
                onTap: () => Get.to(() => AllCategoriesScreen()),
              ),

              CategoriesWidget(),

              // Divider with green line
              Container(
                height: 1,
                color: Colors.green,
                margin: EdgeInsets.symmetric(vertical: 3),
              ),

              // heading
              HeadingWidget(
                headingTitle: "Big Sale",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),

              FlashSaleWidget(),

              // Divider with green line
              Container(
                height: 1,
                color: Colors.green,
                margin: EdgeInsets.symmetric(vertical: 3),
              ),

              HeadingWidget(
                headingTitle: "Recipes",
                headingSubTitle: "According to your taste",
                buttonText: "See More >",
                onTap: () => Get.to(() => AllRecipesScreen()),
              ),

              RecipyWidget(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationWidget(), 
    );
  }
}
