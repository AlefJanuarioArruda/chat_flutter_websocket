// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatController on ChatControllerBase, Store {
  late final _$messagesAtom =
      Atom(name: 'ChatControllerBase.messages', context: context);

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$ChatControllerBaseActionController =
      ActionController(name: 'ChatControllerBase', context: context);

  @override
  void sendMessage(String text) {
    final _$actionInfo = _$ChatControllerBaseActionController.startAction(
        name: 'ChatControllerBase.sendMessage');
    try {
      return super.sendMessage(text);
    } finally {
      _$ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
