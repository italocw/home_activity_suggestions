import 'package:firebase_auth/firebase_auth.dart';

import 'entities/domain_user.dart';

class DomainUserConverter {
   DomainUser fromFirebaseUser({required User firebaseUser}) {
    return DomainUser(
        id: firebaseUser.uid, email: firebaseUser.email ?? firebaseUser.email!);
  }

   DomainUser fromUserCredential(
      {required UserCredential userCredential}) {
    return fromFirebaseUser(firebaseUser: userCredential.user!);
  }
}
