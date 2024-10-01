import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox( {required this.onValue, super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    final inputDecoration = InputDecoration(
      hintText: "End your message with '?'",
      enabledBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
          focusNode.requestFocus();
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTapOutside: (event){
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value){
          textController.clear();
          onValue(value);
          focusNode.requestFocus();
        },
      ),
    );
  }
}
