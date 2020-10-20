import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/store/model/store_model.dart';
import 'package:treeco/view/store/view_model/store_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  StoreModel storeModel;
  StoreViewModel storeViewModel;

  List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    return BaseView<StoreViewModel>(
      viewModel: StoreViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        storeViewModel = model;
        isSelected = [true, false];
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
    backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR).withOpacity(0.05),
        appBar: appBar,
        body: Column(
          children: <Widget>[
            selectPacketsText,
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.getProportionateScreenHeight(24)),
              child: toggleButtons,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: (isSelected[0]==true) ? storeViewModel.monthlyPricingList.length : storeViewModel.annualPricingList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: SizeConfig.screenWidth /
                          SizeConfig.screenHeight /
                          0.65),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(
                          SizeConfig.getProportionateScreenWidth(8)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Color(
                                    ApplicationConstants.BACKGROUND_COLOR2))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      SizeConfig.getProportionateScreenHeight(
                                          8)),
                              child: Text(
                                'package'.locale+(index+1).toString(),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize:
                                        SizeConfig.getProportionateScreenWidth(
                                            13),
                                    fontFamily:
                                        ApplicationConstants.FONT_FAMILY),
                              ),
                            ),
                            packetPriceRow(index),
                            Text(
                              (isSelected[0]==true) ? 'month'.locale : 'year'.locale,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize:
                                      SizeConfig.getProportionateScreenWidth(
                                          12),
                                  fontFamily:
                                      ApplicationConstants.FONT_FAMILY2),
                            ),
                            SizedBox(
                              height:
                                  SizeConfig.getProportionateScreenHeight(16),
                            ),
                            moreCoinAmountRow(index),
                            reelTreeCountRow(index),
                            Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: SizedBox(width:SizeConfig.screenWidth/3.3,
                                child: FlatButton(
                                  child: Text('continue'.locale,
                                    style: TextStyle(
                                        color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                                        fontFamily: ApplicationConstants.FONT_FAMILY),),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: Color(ApplicationConstants
                                              .BACKGROUND_COLOR),
                                          width: 1)),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      );

  Row reelTreeCountRow(int index) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: (isSelected[0]==true) ? (storeViewModel.monthlyPricingList[index].reelTreeCount == "0")
              ? SizedBox()
              : Icon(
                  Icons.check,
                  size: SizeConfig.getProportionateScreenWidth(16),
                  color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                ):Icon(
            Icons.check,
            size: SizeConfig.getProportionateScreenWidth(16),
            color: Color(ApplicationConstants.BACKGROUND_COLOR2),
          ),
        ),
        Expanded(
          child: (isSelected[0]==true) ? (storeViewModel.monthlyPricingList[index].reelTreeCount == "0")
              ? SizedBox()
              : Text(
            (isSelected[0]==true) ?
                   storeViewModel.monthlyPricingList[index].reelTreeCount +
                       'realTree'.locale
                          : storeViewModel.annualPricingList[index].reelTreeCount + 'realTree'.locale,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.getProportionateScreenWidth(13),
                      fontFamily: ApplicationConstants.FONT_FAMILY),
                ) : Text(
            (isSelected[0]==true) ?
            storeViewModel.annualPricingList[index].reelTreeCount + 'realTree'.locale
                : storeViewModel.annualPricingList[index].reelTreeCount + 'realTree'.locale,
            style: TextStyle(
                color: Colors.black54,
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        )
      ],
    );
  }

  Row moreCoinAmountRow(int index) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            Icons.check,
            size: SizeConfig.getProportionateScreenWidth(16),
            color: Color(ApplicationConstants.BACKGROUND_COLOR2),
          ),
        ),
        Expanded(
          child: Text( (isSelected[0]==true) ?
            'dailyCoin'.locale +storeViewModel.monthlyPricingList[index].moreCoinAmount +"x"
              : 'dailyCoin'.locale +storeViewModel.annualPricingList[index].moreCoinAmount+"x",
            style: TextStyle(
                color: Colors.black54,
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        )
      ],
    );
  }

  Row packetPriceRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.getProportionateScreenWidth(8),
              right: SizeConfig.getProportionateScreenWidth(2)),
          child: Text(
            "TL",
            style: TextStyle(
                color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                fontWeight: FontWeight.w500,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
        Text( (isSelected[0]==true) ?
          storeViewModel.monthlyPricingList[index].packetPrice : storeViewModel.annualPricingList[index].packetPrice,
          style: TextStyle(
              color: Color(ApplicationConstants.BACKGROUND_COLOR2),
              fontSize: SizeConfig.getProportionateScreenWidth(32),
              fontWeight: FontWeight.w500,
              fontFamily: ApplicationConstants.FONT_FAMILY),
        ),
      ],
    );
  }

  ToggleButtons get toggleButtons {
    return ToggleButtons(
      selectedColor: Colors.white,
      fillColor: Color(ApplicationConstants.BACKGROUND_COLOR2),
      borderColor: Color(ApplicationConstants.BACKGROUND_COLOR2),
      selectedBorderColor: Color(ApplicationConstants.BACKGROUND_COLOR2),
      borderRadius: BorderRadius.circular(25),
      isSelected: isSelected,
      children: <Widget>[
        Container(
          child: Text(
            "monthly".locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
          alignment: Alignment.center,
          width: SizeConfig.screenWidth / 2.5,
        ),
        Container(
          child: Text(
            'yearly'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
          alignment: Alignment.center,
          width: SizeConfig.screenWidth / 2.5,
        )
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
    );
  }

  Center get selectPacketsText {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(24)),
        child: Text(
          'choosePackage'.locale,
          style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(15),
              color: Colors.black,
              fontFamily: ApplicationConstants.FONT_FAMILY2),
        ),
      ),
    );
  }

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
