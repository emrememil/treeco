import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/view/personal/gender_input/model/gender_input_model.dart';
import 'package:treeco/view/personal/gender_input/view_model/gender_input_view_model.dart';

class GenderInputScreen extends StatefulWidget {
  @override
  _GenderInputScreenState createState() => _GenderInputScreenState();
}

class _GenderInputScreenState extends State<GenderInputScreen> {
  GenderInputModel genderInputModel;
  GenderInputViewModel genderInputViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<GenderInputViewModel>(
      viewModel: GenderInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        genderInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => null;
}
