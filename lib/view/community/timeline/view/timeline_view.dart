import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/view/community/timeline/model/timeline_model.dart';
import 'package:treeco/view/community/timeline/view_model/timeline_view_model.dart';

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {

  TimelineModel timelineModel;
  TimelineViewModel timelineViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TimelineViewModel>(
      viewModel: TimelineViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        timelineViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => null;
}
