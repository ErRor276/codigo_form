import 'package:equatable/equatable.dart';

import '../enums/_enums.dart';

class User extends Equatable {
  final String firstName,
      lastName,
      email,
      dob,
      nationality,
      cor,
      countryCode,
      phNo;
  final Gender gender;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
    this.gender = Gender.female,
    required this.nationality,
    required this.cor,
    required this.countryCode,
    required this.phNo,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
    Gender? gender,
    String? nationality,
    String? cor,
    String? countryCode,
    String? phNo,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
      cor: cor ?? this.cor,
      countryCode: countryCode ?? this.countryCode,
      phNo: phNo ?? this.phNo,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        dob,
        gender,
        nationality,
        cor,
        countryCode,
        phNo,
      ];

  @override
  String toString() =>
      '''User firstName: $firstName lastName: $lastName email: $email dob: $dob gender $gender nationality $nationality cor $cor countryCode $countryCode phNo $phNo''';
}
