import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_flutter_course/domain/models/message.dart';
import 'package:yes_no_app_flutter_course/main.dart';
import 'package:yes_no_app_flutter_course/providers/chat_provider.dart';
import 'package:yes_no_app_flutter_course/screens/chat_screens/profile_screen.dart';
import 'package:yes_no_app_flutter_course/widgets/chat/my_message_bubble.dart';

import '../../widgets/MessageFieldBox.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final imageAvatar =
        "https://64.media.tumblr.com/avatar_a8771987621a_128.pnj";
    final namePerson = "Novia 😄";
    return Scaffold(
      appBar: AppBar(
        leading: AvatarImage(imageAvatar),
        title: GestureDetector(child: Text(namePerson), onTap: (){
          Navigator.pushNamed(context, '/profileScreen', arguments: {"nameProfile": namePerson});
        },),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              chatProvider.clearChat();
            },
          ),
        ],
        centerTitle: false,
      ),
      body: _ChatView(chatProvider),
    );
  }
}

class AvatarImage extends StatelessWidget {
  final String imageAvatar;
  const AvatarImage(this.imageAvatar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageAvatar),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.network(
                    imageAvatar,
                    fit: BoxFit.fill,
                  ),
                );
              });
        },
      ),
    );
  }
}


class _ChatView extends StatelessWidget {
  final ChatProvider chatProvider;
  _ChatView(this.chatProvider);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return MessageBubble(message);
                },
                itemCount: chatProvider.messageList.length,
              ),
            ),
            MessageFieldBox(
              onValue: (String value) {
                chatProvider.sendMessage(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
