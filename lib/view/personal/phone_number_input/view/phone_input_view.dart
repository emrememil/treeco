import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/view/personal/phone_number_input/model/phone_input_model.dart';
import 'package:treeco/view/personal/phone_number_input/view_model/phone_input_view_model.dart';

class PhoneInputScreen extends StatefulWidget {
  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  PhoneInputModel phoneInputModel;
  PhoneInputViewModel phoneInputViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<PhoneInputViewModel>(
      viewModel: PhoneInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        phoneInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => null;
}
