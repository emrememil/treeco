
import 'package:treeco/core/base/model/base_model.dart';

class WelcomeModel extends BaseModel{

  static List<Map<String, String>> welcomeData =
  [
    {
      "title": "Treeco'ya hoş geldin",
      "text": "Treeco daha yeşil bir geleceğe yatırım yapma amacıyla kurulmuş "
          "sosyal girişim platformudur. Kendin için, dünya için, gelecek için",
      "hashtag": "#BirlikteYeşillendireceğiz",
      "imagePath": "assets/animation/welcome3.json"
    },
    {
      "title": "Treeco'ya hoş geldin",
      "text": "Kaliteli bir yaşam ve daha sağlıklı yarınlar için ",
      "hashtag": "#BirlikteYeşillendireceğiz",
      "imagePath": "assets/animation/welcome2.json"
    },
    {
      "title": "Treeco'ya hoş geldin",
      "text": "Uygulamada topladığın puanlarla önce sanal ormanını oluştur daha sonra "
          "bunu gerçek ormana dönüştüreceğiz.",
      "hashtag": "#BirlikteYeşillendireceğiz",
      "imagePath": "assets/animation/welcome1.json"
    }
  ];


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