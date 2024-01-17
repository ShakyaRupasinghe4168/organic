// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_plate/models/user_model.dart'; // Import your EditProfileScreen
import 'package:organic_plate/screens/user-panel/edit-profile-screen.dart';
import 'package:organic_plate/utils/app_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.userData}) : super(key: key);

  final UserModel? userData;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? _user;
  late UserModel? _userData;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _userData = widget.userData;

    if (_user != null) {
      _getUserData();
    }
  }

  Future<void> _getUserData() async {
    if (_user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(_user!.uid).get();

      UserModel userData = UserModel.fromMap(snapshot.data()!);

      setState(() {
        _userData = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(userData: _userData),
                ),
              );
            },
          ),
        ],
      ),
      body: _user != null && _userData != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 17, 155, 102),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.person,
                      color: AppConstant.appTextColor,
                      size: 100.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _userData!.username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _userData!.email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ProfileDetailRow("Phone", _userData!.phone),
                  ProfileDetailRow("Country", _userData!.country),
                  ProfileDetailRow("City", _userData!.city),
                  ProfileDetailRow("Street", _userData!.street),
                  ProfileDetailRow("Address", _userData!.userAddress),
                  ProfileDetailRow("Created On", _userData!.createdOn.toString()),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
