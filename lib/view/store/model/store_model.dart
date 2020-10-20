import 'package:treeco/core/base/model/base_model.dart';



class StoreModel extends BaseModel{

  String packetPrice;
  String moreCoinAmount;
  String reelTreeCount;


  StoreModel(this.packetPrice,
      this.moreCoinAmount, this.reelTreeCount);

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