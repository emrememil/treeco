import 'package:treeco/core/base/model/base_model.dart';

class AchievementsModel extends BaseModel{

  String title;
  int prizeCoin;
  String imagePath;
  int plantedTreeCount;
  int friendsCount;

  AchievementsModel(this.plantedTreeCount, this.friendsCount);

  AchievementsModel.listing(this.title, this.prizeCoin, this.imagePath);

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