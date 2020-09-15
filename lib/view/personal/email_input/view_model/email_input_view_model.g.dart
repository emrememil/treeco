// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_input_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmailInputViewModel on _EmailInputViewModelBase, Store {
  final _$emailCheckAtom = Atom(name: '_EmailInputViewModelBase.emailCheck');

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

  final _$emailFocusAtom = Atom(name: '_EmailInputViewModelBase.emailFocus');

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

  final _$emailAddressAtom =
      Atom(name: '_EmailInputViewModelBase.emailAddress');

  @override
  String get emailAddress {
    _$emailAddressAtom.reportRead();
    return super.emailAddress;
  }

  @override
  set emailAddress(String value) {
    _$emailAddressAtom.reportWrite(value, super.emailAddress, () {
      super.emailAddress = value;
    });
  }

  final _$_EmailInputViewModelBaseActionController =
      ActionController(name: '_EmailInputViewModelBase');

  @override
  void emailOnChanged(String val) {
    final _$actionInfo = _$_EmailInputViewModelBaseActionController.startAction(
        name: '_EmailInputViewModelBase.emailOnChanged');
    try {
      return super.emailOnChanged(val);
    } finally {
      _$_EmailInputViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailCheck: ${emailCheck},
emailFocus: ${emailFocus},
emailAddress: ${emailAddress}
    ''';
  }
}
