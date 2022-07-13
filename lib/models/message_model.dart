class MessageModel {
  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dateMessage;
  final String imageUrl;
  const MessageModel(
      {required this.senderName,
      required this.message,
      required this.messageDate,
      required this.dateMessage,
      required this.imageUrl});
}
