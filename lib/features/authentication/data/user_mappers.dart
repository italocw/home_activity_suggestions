import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_sugestions/features/authentication/domain/entities/domain_user.dart';

extension UserExtension on User {
  DomainUser toDomainUser() => DomainUser(id: uid, email: email!);
}

extension UserCredentialExtension on UserCredential {
  DomainUser toDomainUser() => user!.toDomainUser();
}

