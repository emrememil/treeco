// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_forest_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RealForestViewModel on _RealForestViewModelBase, Store {
  final _$byYouAtom = Atom(name: '_RealForestViewModelBase.byYou');

  @override
  int get byYou {
    _$byYouAtom.reportRead();
    return super.byYou;
  }

  @override
  set byYou(int value) {
    _$byYouAtom.reportWrite(value, super.byYou, () {
      super.byYou = value;
    });
  }

  final _$byYourFriendsAtom =
      Atom(name: '_RealForestViewModelBase.byYourFriends');

  @override
  int get byYourFriends {
    _$byYourFriendsAtom.reportRead();
    return super.byYourFriends;
  }

  @override
  set byYourFriends(int value) {
    _$byYourFriendsAtom.reportWrite(value, super.byYourFriends, () {
      super.byYourFriends = value;
    });
  }

  final _$byEveryoneAtom = Atom(name: '_RealForestViewModelBase.byEveryone');

  @override
  int get byEveryone {
    _$byEveryoneAtom.reportRead();
    return super.byEveryone;
  }

  @override
  set byEveryone(int value) {
    _$byEveryoneAtom.reportWrite(value, super.byEveryone, () {
      super.byEveryone = value;
    });
  }

  @override
  String toString() {
    return '''
byYou: ${byYou},
byYourFriends: ${byYourFriends},
byEveryone: ${byEveryone}
    ''';
  }
}
