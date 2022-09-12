class socialaddcommentmodel
{
  dynamic name;
  dynamic dataTime;
  String? postId;
  dynamic text;
  dynamic image;



  socialaddcommentmodel({
    required this.name,
    required this.dataTime,
    required this.postId,
    required this.text,
    required this.image,
  });
  socialaddcommentmodel.fromjson(Map<String,dynamic>?json)
  {
    name=json!['name'];
    dataTime=json['dataTime'];
    image=json['image'];
    text=json['text'];
    postId=json['postId'];
  }
  Map<String,dynamic>toMap()
  {
    return  {
      'name':name,
      'image':image,
      'postId':postId,
      'dataTime':dataTime,
      'text':text,
    };
  }
}