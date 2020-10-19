import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'store_view_model.g.dart';

class StoreViewModel = _StoreViewModelBase with _$StoreViewModel;

abstract class _StoreViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  List<bool> isSelected = [false, false];

  @action
  changeSelected (int index){
    for (int indexBtn = 0;indexBtn < isSelected.length;indexBtn++) {
      if (indexBtn == index) {
        isSelected[indexBtn] = !isSelected[indexBtn];
      } else {
        isSelected[indexBtn] = false;
      }
    }
  }

}