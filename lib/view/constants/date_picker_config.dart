import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerConfig{

  static DateTime now = DateTime.now();
  static DateTime minDateTime = DateTime(now.year-70,01,01);
  static DateTime maxDateTime = DateTime(now.year-7, 12,31);
  static String dateFormat = 'yyyy-MMMM-dd';
  static DateTimePickerLocale locale = DateTimePickerLocale.tr;

}