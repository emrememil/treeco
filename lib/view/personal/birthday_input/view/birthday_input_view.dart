import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/view/personal/birthday_input/model/birthday_input_model.dart';
import 'package:treeco/view/personal/birthday_input/view_model/birthday_input_view_model.dart';

class BirthdayInputScreen extends StatefulWidget {
  @override
  _BirthdayInputScreenState createState() => _BirthdayInputScreenState();
}

class _BirthdayInputScreenState extends State<BirthdayInputScreen> {
  BirthdayInputModel birthdayInputModel;
  BirthdayInputViewModel birthdayInputViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<BirthdayInputViewModel>(
      viewModel: BirthdayInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        birthdayInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => null;
}
