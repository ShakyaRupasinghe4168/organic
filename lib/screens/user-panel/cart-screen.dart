// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:organic_plate/models/cart-model.dart';
import 'package:organic_plate/screens/user-panel/checkout-screen.dart';
import 'package:organic_plate/utils/app_constant.dart';
import 'package:organic_plate/controllers/cart-price-controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController =
      Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
       
        backgroundColor: AppConstant.appMainColor,
      title: Text(
          'Cart Screen',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .collection('cartOrders')
            .snapshots(),
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
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final productData = snapshot.data!.docs[index];
                  CartModel cartModel = CartModel.fromMap(productData.data() as Map<String, dynamic>);
                  //calculate price
                  productPriceController.fetchProductPrice();
                  return SwipeActionCell(
                    key: ObjectKey(cartModel.productId),
                    trailingActions: [
                      SwipeAction(
                        title: "Delete",
                        forceAlignmentToBoundary: true,
                        performsFirstActionWithFullSwipe: true,
                        onTap: (CompletionHandler handler) async {
                          print('deleted');

                          await FirebaseFirestore.instance
                              .collection('cart')
                              .doc(user!.uid)
                              .collection('cartOrders')
                              .doc(cartModel.productId)
                              .delete();
                        },
                      )
                    ],
                    child: Card(
                      elevation: 5,
                      color: AppConstant.appTextColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.appMainColor,
                          backgroundImage:
                              NetworkImage(cartModel.productImages),
                        ),
                        title: Text(cartModel.productName),
                        subtitle: 
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text("Price: Rs "),
    Text(cartModel.productTotalPrice.toString()),
    SizedBox(
      width: Get.width / 20.0,
    ),
    GestureDetector(
      onTap: () async {
        if (cartModel.productQuantity > 1) {
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(user!.uid)
              .collection('cartOrders')
              .doc(cartModel.productId)
              .update({
            'productQuantity': cartModel.productQuantity - 1,
            'productTotalPrice': (double.parse(cartModel.fullPrice) *
                (cartModel.productQuantity - 1))
          });
        } else {
          // Remove the product if quantity becomes 0
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(user!.uid)
              .collection('cartOrders')
              .doc(cartModel.productId)
              .delete();
        }
      },
      child: CircleAvatar(
        radius: 12.0,
        backgroundColor: Color.fromARGB(255, 34, 173, 120),
        child: Text('-'),
      ),
    ),
    SizedBox(
      width: Get.width / 22.0,
    ),
    GestureDetector(
      onTap: () async {
        if (cartModel.productQuantity > 0) {
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(user!.uid)
              .collection('cartOrders')
              .doc(cartModel.productId)
              .update({
            'productQuantity': cartModel.productQuantity + 1,
            'productTotalPrice':
                double.parse(cartModel.fullPrice) +
                    double.parse(cartModel.fullPrice) *
                        (cartModel.productQuantity + 1)
          });
        }
      },
      child: CircleAvatar(
        radius: 12.0,
        backgroundColor: Color.fromARGB(255, 34, 173, 120),
        child: Text('+'),
      ),
    ),
    // Wrap the Container in a Flexible widget
    Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          // Set the desired color
        ),
        child: Text(
          "Count " + cartModel.productQuantity.toString(),
          style: TextStyle(color: Color.fromARGB(255, 58, 57, 57)),
        ),
      ),
    ),
    SizedBox(
      height: Get.height / 29.0,
    ),
  ],
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
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                " Total ${productPriceController.totalPrice.value.toStringAsFixed(1)} : LKR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2.5,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.appScendoryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {
                      Get.to(() => CheckOutScreen());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}