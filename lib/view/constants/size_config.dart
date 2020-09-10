import 'package:flutter/material.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static Orientation orientation;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier=blockSizeVertical;
    imageSizeMultiplier=blockSizeHorizontal;
    heightMultiplier=blockSizeVertical;

    print("yatay: $blockSizeHorizontal");
    print("dikey: $blockSizeVertical");
    print("ekran genişliği: $screenWidth");
    print("ekran yüksekliği: $screenHeight");

  }

  static double getProportionateScreenHeight(double inputHeight){
    double screenHeight = SizeConfig.screenHeight;
    return (inputHeight / 812.0) * screenHeight;
  }

  static double getProportionateScreenWidth(double inputWidth){
    double screenWidth = SizeConfig.screenWidth;
    return (inputWidth / 375.0) * screenWidth;
  }

}