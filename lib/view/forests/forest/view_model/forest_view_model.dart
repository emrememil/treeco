import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';

part 'forest_view_model.g.dart';

class ForestViewModel = _ForestViewModelBase with _$ForestViewModel;

abstract class _ForestViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  final Color leftBarColor = const Color(0xff50A387);
  final Color rightBarColor = const Color(0xffF6C358);
  final double width = 7;

  @observable
  List<BarChartGroupData> rawBarGroups;
  @observable
  List<BarChartGroupData> showingBarGroups;
  @observable
  int touchedGroupIndex;

  @action
  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: leftBarColor,
        width: width,
      ),
      BarChartRodData(
        y: y2,
        color: rightBarColor,
        width: width,
      ),
    ]);
  }

  @action
  touchInputIf(){
    touchedGroupIndex = -1;
    showingBarGroups = List.of(rawBarGroups);
  }
  @action
  touchInputElse(){
    showingBarGroups = List.of(rawBarGroups);
    if (touchedGroupIndex != -1) {
      double sum = 0;
      for (BarChartRodData rod
      in showingBarGroups[touchedGroupIndex].barRods) {
        sum += rod.y;
      }
      final avg =
          sum / showingBarGroups[touchedGroupIndex].barRods.length;

      showingBarGroups[touchedGroupIndex] =
          showingBarGroups[touchedGroupIndex].copyWith(
            barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
              return rod.copyWith(y: avg);
            }).toList(),
          );
    }
  }
  @action
  getTitlesData(value){
    switch (value.toInt()) {
      case 0:
        return 'mon'.locale;
      case 1:
        return 'tue'.locale;
      case 2:
        return 'wed'.locale;
      case 3:
        return 'thu'.locale;
      case 4:
        return 'fri'.locale;
      case 5:
        return 'sat'.locale;
      case 6:
        return 'sun'.locale;
      default:
        return '';
    }
  }
  @action
  leftGetTitles(value){
    if (value == 0) {
      return '1';
    } else if (value == 10) {
      return '5';
    } else if (value == 19) {
      return '10';
    } else {
      return '';
    }
  }
}