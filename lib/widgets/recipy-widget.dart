// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:organic_plate/models/recipy-model.dart';
import 'package:organic_plate/screens/user-panel/recipy-details-screen.dart';

class RecipyWidget extends StatelessWidget {
  const RecipyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('recipes').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: Get.height / 5,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No recipes found!"),
          );
        }

        if (snapshot.data != null) {
          return Container(
  height: Get.height / 4.0,
  child: ListView.builder(
    itemCount: snapshot.data!.docs.length,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      // Directly create an instance of RecipeModel using fromMap method
      RecipeModel recipeModel = RecipeModel.fromMap(
        snapshot.data!.docs[index].data() as Map<String, dynamic>,
      );
                return GestureDetector(
                   onTap: () => Get.to(() =>
                          RecipesDetailScreen(recipeModel: recipeModel)),
                     child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      child: FillImageCard(
                        borderRadius: 20.0,
                        width: Get.width / 4.0,
                        heightImage: Get.height / 12,
                        imageProvider: CachedNetworkImageProvider(
                          recipeModel.recipeImg,
                        ),
                        title: Center(
                          child: Text(
                            recipeModel.recipeName,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
