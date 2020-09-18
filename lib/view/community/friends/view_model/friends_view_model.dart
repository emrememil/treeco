import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/community/friends/model/friends_model.dart';

part 'friends_view_model.g.dart';

class FriendsViewModel = _FriendsViewModelBase with _$FriendsViewModel;

abstract class _FriendsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  List<FriendsModel> allFriend=[
    FriendsModel("assets/images/pp.png","Hasan Türk",5,295),
    FriendsModel("assets/images/pp.png","Ali Aydın",8,1500),
    FriendsModel("assets/images/pp.png","Burak Demir",12,3782),
    FriendsModel("assets/images/pp.png","Hilal Yıldız",2,4530),
    FriendsModel("assets/images/pp.png","İpek Çebi",2,843),
    FriendsModel("assets/images/pp.png","Fatma Aydın",173,15872),
    FriendsModel("assets/images/pp.png","Hasan Türk",5,295),
    FriendsModel("assets/images/pp.png","Ali Aydın",8,1500),
    FriendsModel("assets/images/pp.png","Burak Demir",12,3782),
  ];

}