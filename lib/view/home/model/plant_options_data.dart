import 'package:treeco/core/extension/string_extension.dart';

class PlantOptionsData{
  final text;
  final imagePath;

  PlantOptionsData(this.text, this.imagePath);
}

List<PlantOptionsData> plantOptions = [
  PlantOptionsData('plantOptionsCoin'.locale,"assets/animation/coin2.json"),
  PlantOptionsData('plantOptionsQR'.locale,"assets/animation/qr_code.json"),
  PlantOptionsData('plantOptionsCode'.locale,"assets/animation/code.json"),
  PlantOptionsData('plantOptionsPremium'.locale,"assets/animation/premium.json")
];