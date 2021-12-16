import 'dart:io';

import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const _dafaultImage = AssetImage('assets/images/avatar.png');
  final ChatMessage message;
  final bool belongsToMe;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.belongsToMe,
  }) : super(key: key);

  Widget _showUserImage(String imageURL) {
    ImageProvider? provider;
    final uri = Uri.parse(imageURL);

    if (uri.path.contains('assets/images/avatar.png')) {
      provider = _dafaultImage;
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 260),
              decoration: BoxDecoration(
                color: belongsToMe ? Colors.blue.shade300 : Colors.green.shade300,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: belongsToMe ? Radius.circular(12) : Radius.circular(0),
                    bottomRight: belongsToMe ? Radius.circular(0) : Radius.circular(12)),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: belongsToMe ? 16 : 62,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: belongsToMe ? Colors.black : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    message.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: belongsToMe ? Colors.black : Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 20,
          left: belongsToMe ? 200 : 16,
          right: belongsToMe ? 200 : null,
          child: _showUserImage(message.userImageURL),
        ),
      ],
    );
  }
}
