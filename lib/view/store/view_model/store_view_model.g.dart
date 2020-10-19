// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreViewModel on _StoreViewModelBase, Store {
  final _$isSelectedAtom = Atom(name: '_StoreViewModelBase.isSelected');

  @override
  List<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(List<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  final _$_StoreViewModelBaseActionController =
      ActionController(name: '_StoreViewModelBase');

  @override
  dynamic changeSelected(int index) {
    final _$actionInfo = _$_StoreViewModelBaseActionController.startAction(
        name: '_StoreViewModelBase.changeSelected');
    try {
      return super.changeSelected(index);
    } finally {
      _$_StoreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected}
    ''';
  }
}
