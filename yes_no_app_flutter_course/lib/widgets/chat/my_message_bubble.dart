import 'package:flutter/material.dart';
import 'package:yes_no_app_flutter_course/domain/models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble(this.message, {super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final who = (message.fromWho == FromWho.me) ? 0 : 1;
    return Column(
      crossAxisAlignment: who == 0
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: who == 0
              ? colors.primary
              : colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        who != 0 ?
         Column(
          children: [
            _ImageBubble(message: message,),
            const SizedBox(height: 10),
          ],
        )
        : const SizedBox(),
        Text(message.sent, style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final Message message;
  const _ImageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(message.imageUrl!,
            loadingBuilder: (context, child, loadingProgress){
              if(loadingProgress == null){
                return child;
              }
              return Container(
                width: 50,
                height: 50,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
            width: size.width *0.4,
          ),
        ),
        onTap: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(content: Image.network(message.imageUrl!),);
          });
        }
    );
  }
}
