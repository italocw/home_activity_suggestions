import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DomainUser extends Equatable{
  final String id;
  final String email;

  const DomainUser({required this.id, required this.email});


  @override
  // TODO: implement props
  List<Object?> get props => [id, email];

}
