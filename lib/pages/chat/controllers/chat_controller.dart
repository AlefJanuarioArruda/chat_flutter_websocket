
import 'package:mobx/mobx.dart';

import '../../../configuration/user_config.dart';
import '../../../entities/message_entity.dart';
import '../../../services/message_service.dart';

part 'chat_controller.g.dart';

class ChatController = ChatControllerBase with _$ChatController;

abstract class ChatControllerBase with Store {
  MessageService messageService = MessageService();

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  @action
  void sendMessage(String text) {
    final message = Message(
      name: UserConfig.name,
      text: text,
    );
    messages.add(message);
    messageService.sendMessage(message);
  }

  void init() {
    messageService.initConnection();
    messageService.broadcastNotifications(
      onReceive: (message) {
        messages.add(message);
      },
    );
  }
}
