import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataSource {
  final FirebaseAuth _firebaseAuth;
  AuthenticationDataSource({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  get currentUser => _firebaseAuth.currentUser;
  Future<UserCredential> createAccount({required String email, required String password}) async =>
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<void> logout() async => _firebaseAuth.signOut();

  Future<UserCredential> signIn({required String email, required String password}) async =>
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  Stream<User?> getUserStream() => _firebaseAuth.authStateChanges();

}
