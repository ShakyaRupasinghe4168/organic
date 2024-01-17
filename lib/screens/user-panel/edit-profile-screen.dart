// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organic_plate/models/user_model.dart';
import 'package:organic_plate/utils/app_constant.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel? userData;

  const EditProfileScreen({Key? key, required this.userData}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _userAddressController = TextEditingController();
  // Add controllers for other fields

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.userData?.username ?? "";
    _emailController.text = widget.userData?.email ?? "";
    _phoneController.text = widget.userData?.phone ?? "";
    _countryController.text = widget.userData?.country ?? "";
    _cityController.text = widget.userData?.city ?? "";
    _streetController.text = widget.userData?.street ?? "";
    _userAddressController.text = widget.userData?.userAddress ?? "";
    // Initialize other controllers as needed
  }

  void _saveChanges() async {
    // Get the edited values from controllers
    String editedUsername = _usernameController.text;
    String editedEmail = _emailController.text;
    String editedPhone = _phoneController.text;
    String editedCountry = _countryController.text;
    String editedCity = _cityController.text;
    String editedStreet = _streetController.text;
    String editedUserAddress = _userAddressController.text;
    // Get other edited values

    // Update the UserModel instance with the edited values
    UserModel editedUserData = widget.userData!.copyWith(
      username: editedUsername,
      email: editedEmail,
      phone: editedPhone,
      country: editedCountry,
      city: editedCity,
      street: editedStreet,
      userAddress: editedUserAddress,
      // Update other fields
    );

    // Save the edited data to Firebase
    await _updateUserDataInFirebase(editedUserData);

    // Navigate back to the ProfileScreen
    Navigator.pop(context);
  }

  Future<void> _updateUserDataInFirebase(UserModel editedUserData) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(editedUserData.uId)
          .update(editedUserData.toMap());
      // Optionally, you can also update the local state in the ProfileScreen
      // to reflect the changes immediately without requiring a reload.
    } catch (error) {
      print("Error updating user data: $error");
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
       
        backgroundColor: AppConstant.appMainColor,
      title: Text(
          "Edit Profile",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(labelText: 'Country'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(labelText: 'Street'),
              ),
              TextFormField(
                controller: _userAddressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              // Add other form fields for editing other details

              SizedBox(height: 16),

              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
