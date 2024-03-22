import 'package:firebase_auth/firebase_auth.dart';

import 'entities/domain_user.dart';

class DomainUserConverter {
   DomainUser? fromFirebaseUser({required User? firebaseUser}) {
    return firebaseUser != null ? DomainUser(
        id: firebaseUser.uid, email: firebaseUser.email ?? firebaseUser.email!) : null;
  }

   DomainUser? fromUserCredential(
      {required UserCredential? userCredential}) {
    return userCredential != null ? fromFirebaseUser(firebaseUser: userCredential.user!) : null;
  }
}
