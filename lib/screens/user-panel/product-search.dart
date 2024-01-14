// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:organic_plate/screens/user-panel/product-details.dart';
import '../../models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }


@override
Widget buildLeading(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      close(context, ''); 
    },
  );
}



  @override
  Widget buildResults(BuildContext context) {
    final String productName = query;
    return FutureBuilder(
      future: getProductByName(productName),
      builder: (context, AsyncSnapshot<ProductModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          return ProductDetailsScreen(productModel: snapshot.data!);
        } 
        
        else if (snapshot.hasError) {
          return Center(child: Text('Error fetching product details'));
        } else {
          return Center(child: Text('Product not found'));
        }
      },
    );
  }

  @override
Widget buildSuggestions(BuildContext context) {
  
  
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Search Format - "Organic Eggs".',
      style: TextStyle(fontSize: 18.0),
    ),
  );
}

  Future<ProductModel?> getProductByName(String productName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('productName', isEqualTo: productName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming only one product matches the name
        DocumentSnapshot productData = querySnapshot.docs.first;

        return ProductModel(
          productId: productData['productId'],
          categoryId: productData['categoryId'],
          productName: productData['productName'],
          categoryName: productData['categoryName'],
          salePrice: productData['salePrice'],
          fullPrice: productData['fullPrice'],
          productImages: productData['productImages'],
          quantity: productData['quantity'],
          isSale: productData['isSale'],
          productDescription: productData['productDescription'],
          createdAt: productData['createdAt'],
          updatedAt: productData['updatedAt'],
        );
      } else {
        return null; 
      }
    } catch (error) {
      
      return null;
    }
  }
}