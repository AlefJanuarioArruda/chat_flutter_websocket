
part of 'chat_controller.dart';

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
