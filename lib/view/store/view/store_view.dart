import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/store/model/store_model.dart';
import 'package:treeco/view/store/view_model/store_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';

class StoreScreen extends StatelessWidget {
  StoreModel storeModel;
  StoreViewModel storeViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<StoreViewModel>(
      viewModel: StoreViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        storeViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenHeight(8)),
                child: Text(
                  "Select your cover",
                  style: TextStyle(
                      fontSize: SizeConfig.getProportionateScreenWidth(15),
                      color: Colors.black,
                      fontFamily: ApplicationConstants.FONT_FAMILY),
                ),
              ),
            ),
            Observer(
              builder:(context) => ToggleButtons(
                selectedColor: Colors.green,
                fillColor: Colors.green,
                borderRadius: BorderRadius.circular(25),
                isSelected: storeViewModel.isSelected,
                borderColor: Colors.black,
                borderWidth: 2,
                selectedBorderColor: Colors.black,
                children: <Widget>[
                  FlatButton(
                    child: Text("Aylık"),
                  ),
                  FlatButton(
                    child: Text("Yıllık"),
                  )
                ],
                onPressed: (int index) {
                  storeViewModel.changeSelected(index);
                  print("Tıklanıldı 0.değer= ${storeViewModel.isSelected[0]} , 1.değer= ${storeViewModel.isSelected[1]}");
                },
              ),
            ),
          ],
        ),
      );

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'store'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }
}
