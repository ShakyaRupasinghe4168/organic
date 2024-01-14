// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, unused_local_variable, avoid_print, prefer_const_declarations, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:organic_plate/models/recipy-model.dart';
import 'package:organic_plate/utils/app_constant.dart';


class RecipesDetailScreen extends StatefulWidget {
  RecipeModel recipeModel; 
  RecipesDetailScreen({super.key, required this.recipeModel});

  @override
  State<RecipesDetailScreen> createState() => _RecipesDetailScreenState();
}

class _RecipesDetailScreenState extends State<RecipesDetailScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
       
        backgroundColor: AppConstant.appMainColor,
       title: Text(
          "Recipes Details",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.recipeModel.recipeImg,
                    fit: BoxFit.cover,
                    width: Get.width - 10,
                    height: 300,
                    placeholder: (context, url) => ColoredBox(
                      color: Colors.white,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  color: Color.fromARGB(255, 196, 223, 208),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.recipeModel.recipeName,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.favorite_outline)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ingredients:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              for (var ingredient in widget.recipeModel.ingredients)
                                Text("- $ingredient"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Instructions:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(widget.recipeModel.instructions),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nutritions:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              for (var nutrition in widget.recipeModel.nutritions)
                                Text("- $nutrition"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
