import 'dart:convert';

class HerMessage {
  final String answer;
  final bool forced;
  final String image;

  HerMessage({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory HerMessage.fromRawJson(String str) => HerMessage.fromJson(json.decode(str));
  factory HerMessage.fromJson(Map<String, dynamic> json) => HerMessage(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );


}
