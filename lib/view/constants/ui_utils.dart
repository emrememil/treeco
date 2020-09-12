import 'package:flutter/widgets.dart';
import 'package:treeco/core/constants/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(double width){
  double deviceWidth = width;

  if(deviceWidth>600){
    return DeviceScreenType.Tablet;
  }else{
    return DeviceScreenType.Mobile;
  }

}