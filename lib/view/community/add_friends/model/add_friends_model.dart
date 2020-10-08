import 'package:treeco/core/base/model/base_model.dart';

class AddFriendsModel extends BaseModel{

  String imagePath;
  String nameAndSurname;
  String username;


  AddFriendsModel(this.imagePath, this.nameAndSurname, this.username);

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