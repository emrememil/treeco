import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/store/model/store_model.dart';

part 'store_view_model.g.dart';

class StoreViewModel = _StoreViewModelBase with _$StoreViewModel;

abstract class _StoreViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}


  List<StoreModel> monthlyPricingList= [
   StoreModel("14.99","1.5","0"),
   StoreModel("24.99","2","1"),
   StoreModel("49.99","3","2"),
   StoreModel("99.99","5","5"),
  ];

  List<StoreModel> annualPricingList= [
    StoreModel("159.99","1.5","5"),
    StoreModel("229.99","2","10"),
    StoreModel("299.99","3","15"),
    StoreModel("399.99","5","20"),
  ];
}