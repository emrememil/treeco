// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forest_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForestViewModel on _ForestViewModelBase, Store {
  final _$rawBarGroupsAtom = Atom(name: '_ForestViewModelBase.rawBarGroups');

  @override
  List<BarChartGroupData> get rawBarGroups {
    _$rawBarGroupsAtom.reportRead();
    return super.rawBarGroups;
  }

  @override
  set rawBarGroups(List<BarChartGroupData> value) {
    _$rawBarGroupsAtom.reportWrite(value, super.rawBarGroups, () {
      super.rawBarGroups = value;
    });
  }

  final _$showingBarGroupsAtom =
      Atom(name: '_ForestViewModelBase.showingBarGroups');

  @override
  List<BarChartGroupData> get showingBarGroups {
    _$showingBarGroupsAtom.reportRead();
    return super.showingBarGroups;
  }

  @override
  set showingBarGroups(List<BarChartGroupData> value) {
    _$showingBarGroupsAtom.reportWrite(value, super.showingBarGroups, () {
      super.showingBarGroups = value;
    });
  }

  final _$touchedGroupIndexAtom =
      Atom(name: '_ForestViewModelBase.touchedGroupIndex');

  @override
  int get touchedGroupIndex {
    _$touchedGroupIndexAtom.reportRead();
    return super.touchedGroupIndex;
  }

  @override
  set touchedGroupIndex(int value) {
    _$touchedGroupIndexAtom.reportWrite(value, super.touchedGroupIndex, () {
      super.touchedGroupIndex = value;
    });
  }

  final _$_ForestViewModelBaseActionController =
      ActionController(name: '_ForestViewModelBase');

  @override
  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    final _$actionInfo = _$_ForestViewModelBaseActionController.startAction(
        name: '_ForestViewModelBase.makeGroupData');
    try {
      return super.makeGroupData(x, y1, y2);
    } finally {
      _$_ForestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic touchInputIf() {
    final _$actionInfo = _$_ForestViewModelBaseActionController.startAction(
        name: '_ForestViewModelBase.touchInputIf');
    try {
      return super.touchInputIf();
    } finally {
      _$_ForestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic touchInputElse() {
    final _$actionInfo = _$_ForestViewModelBaseActionController.startAction(
        name: '_ForestViewModelBase.touchInputElse');
    try {
      return super.touchInputElse();
    } finally {
      _$_ForestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTitlesData(dynamic value) {
    final _$actionInfo = _$_ForestViewModelBaseActionController.startAction(
        name: '_ForestViewModelBase.getTitlesData');
    try {
      return super.getTitlesData(value);
    } finally {
      _$_ForestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic leftGetTitles(dynamic value) {
    final _$actionInfo = _$_ForestViewModelBaseActionController.startAction(
        name: '_ForestViewModelBase.leftGetTitles');
    try {
      return super.leftGetTitles(value);
    } finally {
      _$_ForestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rawBarGroups: ${rawBarGroups},
showingBarGroups: ${showingBarGroups},
touchedGroupIndex: ${touchedGroupIndex}
    ''';
  }
}
