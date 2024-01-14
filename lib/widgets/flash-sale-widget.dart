// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:organic_plate/models/product-model.dart';
import 'package:organic_plate/screens/user-panel/product-details.dart';
import 'package:organic_plate/utils/app_constant.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where('isSale', isEqualTo: true)
          .get(),
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
            child: Text("No products found!"),
          );
        }

        if (snapshot.data != null) {
          return Container(
  height: Get.height / 5,
  child: ListView.builder(
    itemCount: snapshot.data!.docs.length,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final productData = snapshot.data!.docs[index];

      // Directly create an instance of ProductModel using fromMap method
      ProductModel productModel = ProductModel.fromMap(
        productData.data() as Map<String, dynamic>,
      );

      return Row(
        children: [
          GestureDetector(
            onTap: () => Get.to(() =>
                ProductDetailsScreen(productModel: productModel)),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: FillImageCard(
                  borderRadius: 20.0,
                  width: Get.width / 3.5,
                  heightImage: Get.height / 12,
                  imageProvider: CachedNetworkImageProvider(
                    productModel.productImages,
                  ),
                  title: Center(
                    child: Text(
                      productModel.productName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rs ${productModel.salePrice}",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Rs${productModel.fullPrice}",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: AppConstant.appScendoryColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
