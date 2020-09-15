// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_input_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhoneInputViewModel on _PhoneInputViewModelBase, Store {
  final _$inputValidatedAtom =
      Atom(name: '_PhoneInputViewModelBase.inputValidated');

  @override
  bool get inputValidated {
    _$inputValidatedAtom.reportRead();
    return super.inputValidated;
  }

  @override
  set inputValidated(bool value) {
    _$inputValidatedAtom.reportWrite(value, super.inputValidated, () {
      super.inputValidated = value;
    });
  }

  final _$errorMesageAtom = Atom(name: '_PhoneInputViewModelBase.errorMesage');

  @override
  bool get errorMesage {
    _$errorMesageAtom.reportRead();
    return super.errorMesage;
  }

  @override
  set errorMesage(bool value) {
    _$errorMesageAtom.reportWrite(value, super.errorMesage, () {
      super.errorMesage = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_PhoneInputViewModelBase.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  @override
  String toString() {
    return '''
inputValidated: ${inputValidated},
errorMesage: ${errorMesage},
phoneNumber: ${phoneNumber}
    ''';
  }
}
