import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';

class RelativeModel extends Relative {
  static const String jsonRelationId = "relationId";
  static const String jsonFirstName = "firstName";
  static const String jsonLastName = "lastName";
  static const String jsonGender = "gender";
  static const String jsonFullName = "fullName";
  static const String jsonUuid = "uuid";
  static const String jsonRelation = "relation";
  static const String jsonMiddleName = "middleName";
  static const String jsonDateAndTimeOfBirth = "dateAndTimeOfBirth";
  static const String jsonBirthDetails = "birthDetails";
  static const String jsonBirthPlace = "birthPlace";

  final BirthDetailsModel _birthDetailsModel;
  final BirthPlaceModel _birthPlaceModel;

  const RelativeModel(
      {required String relationId,
      required String firstName,
      required String lastName,
      required String gender,
      required BirthDetailsModel birthDetailsModel,
      required BirthPlaceModel birthPlaceModel,
      String? fullName,
      String? uuid,
      String? relation,
      String? middleName,
      String? dateAndTimeOfBirth})
      : _birthDetailsModel = birthDetailsModel,
        _birthPlaceModel = birthPlaceModel,
        super(
            relationId: relationId,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            birthDetails: birthDetailsModel,
            birthPlace: birthPlaceModel,
            fullName: fullName,
            uuid: uuid,
            relation: relation,
            middleName: middleName,
            dateAndTimeOfBirth: dateAndTimeOfBirth);

  factory RelativeModel.fromJSON(Map<String, dynamic> json) {
    final BirthDetailsModel birthDetailsModel =
        BirthDetailsModel.fromJSON(json[jsonBirthDetails]);

    final BirthPlaceModel birthPlaceModel =
        BirthPlaceModel.fromJSON(json[jsonBirthPlace]);

    return RelativeModel(
        relationId: json[jsonRelationId],
        firstName: json[jsonFirstName],
        lastName: json[jsonLastName],
        gender: json[jsonGender],
        fullName: json[jsonFullName],
        uuid: json[jsonUuid],
        relation: json[jsonRelation],
        middleName: json[jsonMiddleName],
        dateAndTimeOfBirth: json[jsonDateAndTimeOfBirth],
        birthDetailsModel: BirthDetailsModel.fromJSON(json[jsonBirthDetails]),
        birthPlaceModel: BirthPlaceModel.fromJSON(json[jsonBirthPlace]));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      jsonRelationId: relationId,
      jsonFirstName: firstName,
      jsonLastName: lastName,
      jsonGender: gender,
      jsonFullName: fullName,
      jsonUuid: uuid,
      jsonRelation: relation,
      jsonMiddleName: middleName,
      jsonDateAndTimeOfBirth: dateAndTimeOfBirth,
      jsonBirthPlace: _birthPlaceModel.toJson(),
      jsonBirthDetails: _birthDetailsModel.toJson()
    };
  }
}

class BirthPlaceModel extends BirthPlace {
  static const String jsonPlaceName = "placeName";
  static const String jsonPlaceId = "placeId";

  const BirthPlaceModel({required String placeName, required String placeId})
      : super(placeName: placeName, placeId: placeId);

  factory BirthPlaceModel.fromJSON(Map<String, dynamic> json) =>
      BirthPlaceModel(
          placeName: json[jsonPlaceName], placeId: json[jsonPlaceId]);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{jsonPlaceName: placeName, jsonPlaceId: placeId};
}

class BirthDetailsModel extends BirthDetails {
  static const String jsonDobYear = "dobYear";
  static const String jsonDobMonth = "dobMonth";
  static const String jsonDobDay = "dobDay";
  static const String jsonTobHour = "tobHour";
  static const String jsonTobMin = "tobMin";
  static const String jsonMeridiem = "meridiem";

  const BirthDetailsModel(
      {required int dobYear,
      required int dobMonth,
      required int dobDay,
      required int tobHour,
      required int tobMin,
      required String meridiem})
      : super(
            dobYear: dobYear,
            dobMonth: dobMonth,
            dobDay: dobDay,
            tobHour: tobHour,
            tobMin: tobMin,
            meridiem: meridiem);

  factory BirthDetailsModel.fromJSON(Map<String, dynamic> json) =>
      BirthDetailsModel(
          dobYear: json[jsonDobYear],
          dobMonth: json[jsonDobMonth],
          dobDay: json[jsonDobDay],
          tobHour: json[jsonTobHour],
          tobMin: json[jsonTobMin],
          meridiem: json[jsonMeridiem]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        jsonDobYear: dobYear,
        jsonDobMonth: dobMonth,
        jsonDobDay: dobDay,
        jsonTobHour: tobHour,
        jsonTobMin: tobMin,
        jsonMeridiem: meridiem
      };
}
