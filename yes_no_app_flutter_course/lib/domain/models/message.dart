enum FromWho { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final String sent;

  Message( {
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.sent,
  });
}
