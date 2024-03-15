import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataSource {
  final FirebaseAuth _firebaseAuth;
  AuthenticationDataSource({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<UserCredential> createAccount(String email, String password) async =>
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<void> logout() async => _firebaseAuth.signOut();

  Future<UserCredential> signIn(String email, String password) async =>
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  Stream<User?> get userStream => _firebaseAuth.authStateChanges();
}
