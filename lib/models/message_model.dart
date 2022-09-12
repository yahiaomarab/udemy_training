class messagemodel
{
  String? senderId;
  String? recevierId;
  String? datatime;
  String? text;
  messagemodel.fromjson(Map<String,dynamic>json)
  {
    text=json['text'];
    senderId=json['senderId'];
    recevierId=json['recevierId'];
    datatime=json['datatime'];
  }
  messagemodel({
    required this.text,
    required this.datatime,
    required this.recevierId,
    required this.senderId,
  });
  Map<String,dynamic>toMap()
  {
    return  {
      'text':text,
      'senderId':senderId,
      'recevierId':recevierId,
      'datatime':datatime,
    };
  }
}