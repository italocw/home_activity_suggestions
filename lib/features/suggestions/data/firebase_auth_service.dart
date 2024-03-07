import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  var _email;
  var _password;
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  set email(String email) => _email = email;
  set password(String password) => _password = password;

  Future<UserCredential> signIn() async => await _firebaseAuth
      .signInWithEmailAndPassword(email: _email, password: _password);

  Future<UserCredential> createAcccount() async => await _firebaseAuth
      .createUserWithEmailAndPassword(email: _email, password: _password);
}
