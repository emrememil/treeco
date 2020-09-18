import 'package:treeco/core/base/model/base_model.dart';

class LeaderBoardModel extends BaseModel{

  String profilePicture;
  String name;
  String username;
  int plantedTree;
  int coin;

  LeaderBoardModel(
      this.profilePicture, this.name, this.username, this.plantedTree, this.coin);

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