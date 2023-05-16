import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;
  String? fullName;
  String? image;
  int? age;
  int? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.email,
    this.fullName,
    this.image,
    this.age,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      email: data['email'],
      fullName: data['full_name'],
      image: data['image'],
      age: data['age'],
      phoneNumber: data['phone_number'],
      createdAt: data['created_at'] != null ? (data['created_at'] as Timestamp).toDate() : DateTime.now(),
      updatedAt: data['updated_at'] != null ? (data['updated_at'] as Timestamp).toDate() : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'image': image,
      'age': age,
      'phone_number': phoneNumber,
      'created_at': createdAt ?? DateTime.now(),
      'updated_at': updatedAt ?? DateTime.now(),
    };
  }
}
