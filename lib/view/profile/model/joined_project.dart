class JoinedProjectsData{
  final title;
  final heroes;
  final plantedTreeCount;
  final imagePath;

  JoinedProjectsData(this.title, this.heroes, this.plantedTreeCount, this.imagePath);


}

List<JoinedProjectsData> joinedProjects = [
  JoinedProjectsData("Ankara Ağaçlandırma Projesi", "56.5K","82K ","assets/images/ankara_map.png"),
  JoinedProjectsData("Sivas Ağaçlandırma Projesi", "15.5K","24K","assets/images/sivas_map.png"),
];