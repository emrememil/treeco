// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InformationSettingsViewModel
    on _InformationSettingsViewModelBase, Store {
  final _$emailCheckAtom =
      Atom(name: '_InformationSettingsViewModelBase.emailCheck');

  @override
  bool get emailCheck {
    _$emailCheckAtom.reportRead();
    return super.emailCheck;
  }

  @override
  set emailCheck(bool value) {
    _$emailCheckAtom.reportWrite(value, super.emailCheck, () {
      super.emailCheck = value;
    });
  }

  final _$emailFocusAtom =
      Atom(name: '_InformationSettingsViewModelBase.emailFocus');

  @override
  bool get emailFocus {
    _$emailFocusAtom.reportRead();
    return super.emailFocus;
  }

  @override
  set emailFocus(bool value) {
    _$emailFocusAtom.reportWrite(value, super.emailFocus, () {
      super.emailFocus = value;
    });
  }

  final _$_InformationSettingsViewModelBaseActionController =
      ActionController(name: '_InformationSettingsViewModelBase');

  @override
  void emailOnChanged(String val) {
    final _$actionInfo = _$_InformationSettingsViewModelBaseActionController
        .startAction(name: '_InformationSettingsViewModelBase.emailOnChanged');
    try {
      return super.emailOnChanged(val);
    } finally {
      _$_InformationSettingsViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailCheck: ${emailCheck},
emailFocus: ${emailFocus}
    ''';
  }
}
