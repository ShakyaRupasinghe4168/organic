// ignore_for_file: file_names

class UserModel {
  final String uId;
  final String username;
  final String email;
  final String phone;
  final String userImg;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String street;
  final bool isAdmin;
  final bool isActive;
  final DateTime createdOn;
  final String city;

  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.userDeviceToken,
    required this.country,
    required this.userAddress,
    required this.street,
    required this.isAdmin,
    required this.isActive,
    required this.createdOn,
    required this.city,
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'username': username,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'street': street,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn.toUtc().toIso8601String(),
      'city': city,
    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      userImg: json['userImg'],
      userDeviceToken: json['userDeviceToken'],
      country: json['country'],
      userAddress: json['userAddress'],
      street: json['street'],
      isAdmin: json['isAdmin'],
      isActive: json['isActive'],
      createdOn: DateTime.parse(json['createdOn']),
      city: json['city'],
    );
  }

  // Copy constructor to create a new instance with updated values
  UserModel copyWith({
    String? uId,
    String? username,
    String? email,
    String? phone,
    String? userImg,
    String? userDeviceToken,
    String? country,
    String? userAddress,
    String? street,
    bool? isAdmin,
    bool? isActive,
    DateTime? createdOn,
    String? city,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userImg: userImg ?? this.userImg,
      userDeviceToken: userDeviceToken ?? this.userDeviceToken,
      country: country ?? this.country,
      userAddress: userAddress ?? this.userAddress,
      street: street ?? this.street,
      isAdmin: isAdmin ?? this.isAdmin,
      isActive: isActive ?? this.isActive,
      createdOn: createdOn ?? this.createdOn,
      city: city ?? this.city,
    );
  }
}
