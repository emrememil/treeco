import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/view/personal/email_input/model/email_input_model.dart';
import 'package:treeco/view/personal/email_input/view_model/email_input_view_model.dart';

class EmailInputScreen extends StatefulWidget {
  @override
  _EmailInputScreenState createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  EmailInputModel emailInputModel;
  EmailInputViewModel emailInputViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<EmailInputViewModel>(
      viewModel: EmailInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        emailInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Container();
}
