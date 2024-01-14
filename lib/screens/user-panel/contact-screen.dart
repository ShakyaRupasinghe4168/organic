// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:organic_plate/utils/app_constant.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
       iconTheme: IconThemeData(color: AppConstant.appTextColor),
       
        backgroundColor: AppConstant.appMainColor,
       ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Green card with farm image
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 183, 233, 184),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/images/farm.jpg',
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 186, 230, 188),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Organic Farm Details",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 4, 78, 66),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Farm Name:   Organic Plate Farm",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "Location:        NuwaraEliya, Sri Lanka",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "Contact Email: organic.organicPlate@gmail.com",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "Contact Phone: +947 733 333 33",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),

              
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 186, 230, 188),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Our Farm",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 4, 78, 66),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Organic Harmony Farm is dedicated to providing fresh, organic produce to our community. Our commitment is to sustainable farming practices, ensuring the health of both people and the environment.",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
