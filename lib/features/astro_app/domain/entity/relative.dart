/*
{
"uuid": "d2483e90-c2c9-4cb0-af47-15880b8c8b97",
"relation": "Brother",
"relationId": 3,
"firstName": "Mohit",
"middleName": null,
"lastName": "Kumar",
"fullName": "Mohit Kumar",
"gender": "MALE",
"dateAndTimeOfBirth": "1994-08-10T08:30:00",
"birthDetails": {
"dobYear": 1994,
"dobMonth": 8,
"dobDay": 10,
"tobHour": 8,
"tobMin": 30,
"meridiem": "AM"
},
"birthPlace": {
"placeName": "Kulharia, Bihar, India",
"placeId": "ChIJwTa3v_6nkjkRC_b2yajUF_M"
}
},*/

import 'package:equatable/equatable.dart';

class Relative extends Equatable {
  final String? uuid;
  final String? relation;
  final String relationId;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? fullName;
  final String gender;
  final String? dateAndTimeOfBirth;
  final BirthPlace birthPlace;
  final BirthDetails birthDetails;

  const Relative(
      {this.uuid,
      this.relation,
      required this.relationId,
      required this.firstName,
      this.middleName,
      required this.lastName,
      this.fullName,
      required this.gender,
      this.dateAndTimeOfBirth,
      required this.birthDetails,
      required this.birthPlace});

  @override
  List<Object?> get props => [
        uuid,
        relation,
        relationId,
        firstName,
        middleName,
        lastName,
        gender,
        dateAndTimeOfBirth,
        birthPlace,
        birthDetails
      ];
}

class BirthDetails extends Equatable {
  final int dobYear;
  final int dobMonth;
  final int dobDay;
  final int tobHour;
  final int tobMin;
  final String meridiem;

  const BirthDetails(
      {required this.dobYear,
      required this.dobMonth,
      required this.dobDay,
      required this.tobHour,
      required this.tobMin,
      required this.meridiem});

  @override
  List<Object?> get props =>
      [dobYear, dobMonth, dobDay, tobHour, tobMin, meridiem];
}

class BirthPlace extends Equatable {
  final String placeName;
  final String placeId;

  const BirthPlace({required this.placeName, required this.placeId});

  @override
  List<Object?> get props => [placeName, placeId];
}
