import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app_flutter_course/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_flutter_course/domain/models/message.dart';

class ChatProvider extends ChangeNotifier{

  final chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
  ];

  Future<void> sendMessage(String text) async{
    final getHour = DateTime.now();
    final format = DateFormat("yyyy-MM-dd : hh:mm");
    final newMessage = Message(text: text, fromWho: FromWho.me, sent: format.format(getHour));
    messageList.add(newMessage);
    if(text.endsWith("?")){
      await herReply();
    }
    moveScrollToBottom();
    notifyListeners();
  }

  Future<void> clearChat() async{
    messageList.clear();
    notifyListeners();
  }

  Future<void> herReply() async{
    final Message herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
  }

  void moveScrollToBottom(){
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut
    );
  }


}