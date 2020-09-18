import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/community/leaderboard/model/leaderboard_model.dart';

part 'leaderboard_view_model.g.dart';

class LeaderBoardViewModel = _LeaderBoardViewModelBase with _$LeaderBoardViewModel;

abstract class _LeaderBoardViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  List<LeaderBoardModel> leaderBoard = [
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",125,7250),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",104,5400),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",98,4283),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",95,3470),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",82,2836),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",77,1591),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",83,1203),
    LeaderBoardModel("assets/images/pp.png","Emre Memil","emrememil",64,1109),


  ];


}