import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/news/model/news_model.dart';

part 'news_view_model.g.dart';

class NewsViewModel = _NewsViewModelBase with _$NewsViewModel;

abstract class _NewsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  List<NewsModel> newsList= [
    NewsModel(DateTime(2020,19,08),"assets/images/dried_forest.jpg","Trendyol ile yeni bir iş birliğine imza atıldı."),
    NewsModel(DateTime(2020,19,08),"assets/images/realforest_background.jpg","Opet ile yeni bir iş birliğine imza atıldı."),
    NewsModel(DateTime(2020,19,08),"assets/images/forest_background.png","Yemeksepeti ile yeni bir iş birliğine imza atıldı.")
  ];

}