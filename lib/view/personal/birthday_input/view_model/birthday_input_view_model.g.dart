// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthday_input_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BirthdayInputViewModel on _BirthdayInputViewModelBase, Store {
  final _$dateTimeAtom = Atom(name: '_BirthdayInputViewModelBase.dateTime');

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  final _$birthdayAtom = Atom(name: '_BirthdayInputViewModelBase.birthday');

  @override
  String get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(String value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$initDataAtom = Atom(name: '_BirthdayInputViewModelBase.initData');

  @override
  DateTime get initData {
    _$initDataAtom.reportRead();
    return super.initData;
  }

  @override
  set initData(DateTime value) {
    _$initDataAtom.reportWrite(value, super.initData, () {
      super.initData = value;
    });
  }

  @override
  String toString() {
    return '''
dateTime: ${dateTime},
birthday: ${birthday},
initData: ${initData}
    ''';
  }
}
