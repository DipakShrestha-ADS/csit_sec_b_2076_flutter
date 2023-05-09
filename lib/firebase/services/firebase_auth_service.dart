import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final faInstance = FirebaseAuth.instance;
  Future<UserCredential> createUser({
    required String email,
    required String password,
  }) async {
    final res = await faInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return res;
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    final res = await faInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return res;
  }

  Future<void> logout() async {
    await faInstance.signOut();
  }
}
