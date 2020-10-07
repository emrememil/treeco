import 'package:treeco/core/base/model/base_model.dart';

class NewsModel extends BaseModel{

  DateTime dateTime;
  String imagePath;
  String description;

  NewsModel(this.dateTime, this.imagePath, this.description);


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