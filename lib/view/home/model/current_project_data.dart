import 'package:treeco/core/extension/string_extension.dart';

class CurrentProjectsData{
  final title;
  final woodland;
  final population;
  final imagePath;

  CurrentProjectsData(this.title, this.woodland, this.population, this.imagePath);


}

List<CurrentProjectsData> currentProjects = [
  CurrentProjectsData("Ankara Ağaçlandırma Projesi", "%10","5.5M nüfus","assets/images/ankara_map.png"),
  CurrentProjectsData("Sivas Ağaçlandırma Projesi", "%24","646B nüfus","assets/images/sivas_map.png"),

];