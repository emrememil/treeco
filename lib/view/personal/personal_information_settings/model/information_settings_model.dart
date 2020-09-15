import 'package:treeco/core/base/model/base_model.dart';

class InformationSettingsModel extends BaseModel{

  String eposta;
  String phoneNumber;
  String gender;
  DateTime dateOfBirth;

  InformationSettingsModel({this.eposta, this.phoneNumber, this.gender, this.dateOfBirth});

  @override
  fromJson(Map<String, Object> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}