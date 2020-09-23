import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/forests/real_forest/model/real_forest_model.dart';
import 'package:treeco/view/forests/real_forest/view_model/real_forest_view_model.dart';

class RealForestScreen extends StatefulWidget {
  @override
  _RealForestScreenState createState() => _RealForestScreenState();
}

class _RealForestScreenState extends State<RealForestScreen> {

  RealForestModel _realForestModel;
  RealForestViewModel _realForestViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<RealForestViewModel>(
      viewModel: RealForestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        _realForestViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold();

}