import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/community/add_friends/model/add_friends_model.dart';

part 'add_friends_view_model.g.dart';

class AddFriendsViewModel = _AddFriendsViewModelBase with _$AddFriendsViewModel;

abstract class _AddFriendsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  final SearchBarController<AddFriendsModel> searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<AddFriendsModel>> getAllUsers(String text) async {
    await Future.delayed(Duration(seconds: 2));

    List<AddFriendsModel> users = [
      AddFriendsModel("assets/images/pp.png","Emre MEMİL","@emrememil"),
      AddFriendsModel("assets/images/pp.png","Hasan Türk","@hasanturk"),
      AddFriendsModel("assets/images/pp.png","Ali Aydın","@aliaydin"),
      AddFriendsModel("assets/images/pp.png","Burak Demir","@burakdemir"),
    ];



//    var random = new Random();
//    for (int i = 0; i < 10; i++) {
//      users.add(AddFriendsModel("$text $i", "body random number : ${random.nextInt(100)}"));
//    }
    return users;
  }

}