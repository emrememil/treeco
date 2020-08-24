// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  final _$emailCheckAtom = Atom(name: '_SignUpViewModelBase.emailCheck');

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

  final _$emailFocusAtom = Atom(name: '_SignUpViewModelBase.emailFocus');

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

  final _$passwordCheckAtom = Atom(name: '_SignUpViewModelBase.passwordCheck');

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

  final _$passwordFocusAtom = Atom(name: '_SignUpViewModelBase.passwordFocus');

  @override
  bool get passwordFocus {
    _$passwordFocusAtom.reportRead();
    return super.passwordFocus;
  }

  @override
  set passwordFocus(bool value) {
    _$passwordFocusAtom.reportWrite(value, super.passwordFocus, () {
      super.passwordFocus = value;
    });
  }

  final _$confirmPasswordCheckAtom =
      Atom(name: '_SignUpViewModelBase.confirmPasswordCheck');

  @override
  bool get confirmPasswordCheck {
    _$confirmPasswordCheckAtom.reportRead();
    return super.confirmPasswordCheck;
  }

  @override
  set confirmPasswordCheck(bool value) {
    _$confirmPasswordCheckAtom.reportWrite(value, super.confirmPasswordCheck,
        () {
      super.confirmPasswordCheck = value;
    });
  }

  final _$confirmPasswordFocusAtom =
      Atom(name: '_SignUpViewModelBase.confirmPasswordFocus');

  @override
  bool get confirmPasswordFocus {
    _$confirmPasswordFocusAtom.reportRead();
    return super.confirmPasswordFocus;
  }

  @override
  set confirmPasswordFocus(bool value) {
    _$confirmPasswordFocusAtom.reportWrite(value, super.confirmPasswordFocus,
        () {
      super.confirmPasswordFocus = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_SignUpViewModelBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  void emailOnChanged(String val) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.emailOnChanged');
    try {
      return super.emailOnChanged(val);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordOnChanged(String val) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.passwordOnChanged');
    try {
      return super.passwordOnChanged(val);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void confirmPasswordOnChanged(String val) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.confirmPasswordOnChanged');
    try {
      return super.confirmPasswordOnChanged(val);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailCheck: ${emailCheck},
emailFocus: ${emailFocus},
passwordCheck: ${passwordCheck},
passwordFocus: ${passwordFocus},
confirmPasswordCheck: ${confirmPasswordCheck},
confirmPasswordFocus: ${confirmPasswordFocus},
password: ${password},
confirmPassword: ${confirmPassword}
    ''';
  }
}
