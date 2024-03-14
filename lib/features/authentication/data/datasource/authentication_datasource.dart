import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataSource {
  final FirebaseAuth firebaseAuth;
  AuthenticationDataSource({required this.firebaseAuth});

  Future<UserCredential> createAccount(String email, String password) async =>
      firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<void> logout() async => firebaseAuth.signOut();

  Future<UserCredential> signIn(String email, String password) async =>
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

  Stream<User?> get userStream => firebaseAuth.authStateChanges();
}
