// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  final _$rememberMeAtom = Atom(name: '_SignInViewModelBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$passwordCheckAtom = Atom(name: '_SignInViewModelBase.passwordCheck');

  @override
  bool get passwordCheck {
    _$passwordCheckAtom.reportRead();
    return super.passwordCheck;
  }

  @override
  set passwordCheck(bool value) {
    _$passwordCheckAtom.reportWrite(value, super.passwordCheck, () {
      super.passwordCheck = value;
    });
  }

  final _$emailCheckAtom = Atom(name: '_SignInViewModelBase.emailCheck');

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

  final _$focus2Atom = Atom(name: '_SignInViewModelBase.focus2');

  @override
  bool get focus2 {
    _$focus2Atom.reportRead();
    return super.focus2;
  }

  @override
  set focus2(bool value) {
    _$focus2Atom.reportWrite(value, super.focus2, () {
      super.focus2 = value;
    });
  }

  final _$focus1Atom = Atom(name: '_SignInViewModelBase.focus1');

  @override
  bool get focus1 {
    _$focus1Atom.reportRead();
    return super.focus1;
  }

  @override
  set focus1(bool value) {
    _$focus1Atom.reportWrite(value, super.focus1, () {
      super.focus1 = value;
    });
  }

  final _$_SignInViewModelBaseActionController =
      ActionController(name: '_SignInViewModelBase');

  @override
  void changeRememberMe(bool val) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.changeRememberMe');
    try {
      return super.changeRememberMe(val);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordOnChanged(String val) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.passwordOnChanged');
    try {
      return super.passwordOnChanged(val);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emailOnChanged(String val) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.emailOnChanged');
    try {
      return super.emailOnChanged(val);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rememberMe: ${rememberMe},
passwordCheck: ${passwordCheck},
emailCheck: ${emailCheck},
focus2: ${focus2},
focus1: ${focus1}
    ''';
  }
}
