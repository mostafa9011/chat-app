class Message {
  String text;
  Message({required this.text});
  factory Message.fromJason(jasonData){
    return Message(text: jasonData['message']);
  }

}