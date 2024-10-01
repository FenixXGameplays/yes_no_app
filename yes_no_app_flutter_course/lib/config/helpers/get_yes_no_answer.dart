import 'package:http/http.dart' as http;
import 'package:yes_no_app_flutter_course/domain/models/her_message.dart';
import 'package:yes_no_app_flutter_course/domain/models/message.dart';
import 'package:intl/intl.dart';

class GetYesNoAnswer{


  Future<Message> getAnswer() async {
    var response = await http.get(Uri.parse("https://yesno.wtf/api"));
    if(response.statusCode == 200){
      final responseBody = HerMessage.fromRawJson(response.body);
      final getHour = DateTime.now();
      final format = DateFormat("yyyy-MM-dd : hh:mm");
      return Message(
          text: responseBody.answer,
          fromWho: FromWho.other,
          imageUrl: responseBody.image,
          sent: format.format(getHour),
      );
    }
    return response.body as Message;
  }
}