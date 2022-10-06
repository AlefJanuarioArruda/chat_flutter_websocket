import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.name,
    required this.message,
    this.direction = MessageDirection.from,
  }) : super(key: key);

  final String name;
  final String message;
  final MessageDirection direction;

  @override
  Widget build(BuildContext context) {
    return _MessageContainer(
      messageDirection: direction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              //backgroundColor: Colors.white,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            message,
            style: const TextStyle(fontSize: 16,color: Colors.white),
          ),
        ],
      ),
    );
  }
}

enum MessageDirection {
  from,
  to,
}

class _MessageContainer extends Container {
  _MessageContainer({
    required Widget child,
    required MessageDirection messageDirection,
  }) : super(
          child: child,
          decoration: messageDirection == MessageDirection.from
              ?  BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                )
              : const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
          margin: messageDirection == MessageDirection.from
              ? const EdgeInsets.fromLTRB(100, 10, 10, 10)
              : const EdgeInsets.fromLTRB(10, 10, 100, 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        );
}
