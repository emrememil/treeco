// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_input_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenderInputViewModel on _GenderInputViewModelBase, Store {
  final _$genderAtom = Atom(name: '_GenderInputViewModelBase.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  @override
  String toString() {
    return '''
gender: ${gender}
    ''';
  }
}
