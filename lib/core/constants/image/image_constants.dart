class ImageConstants {
  static ImageConstants _instace;

  static ImageConstants get instance {
    if (_instace == null) _instace = ImageConstants._init();
    return _instace;
  }

  ImageConstants._init();

  //String get logo => toPng("emre");

  String toPng(String name) => "assets/images/$name.png";
}
