import 'package:treeco/core/base/model/base_model.dart';

class FriendsModel extends BaseModel{

  String profilePicture;
  String name;
  int plantedTree;
  int coin;

  FriendsModel(this.profilePicture, this.name, this.plantedTree, this.coin);

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