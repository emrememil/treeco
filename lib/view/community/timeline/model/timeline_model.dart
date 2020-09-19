import 'package:treeco/core/base/model/base_model.dart';

class TimelineModel extends BaseModel{

  String profilePicture;
  String name;
  DateTime date;
  String message;

  TimelineModel(this.profilePicture, this.name, this.date, this.message);

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