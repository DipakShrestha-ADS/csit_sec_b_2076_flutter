import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/firebase/models/user_model.dart';

class FirestoreServices {
  final fsInstance = FirebaseFirestore.instance;
  final userCollection = "users";

  Future<void> createUser(UserModel userModel) async {
    final userColRef = fsInstance.collection(userCollection);
    final id = userColRef.doc().id;
    userModel.id = id;
    await userColRef.doc(id).set(userModel.toJson());
  }
}
