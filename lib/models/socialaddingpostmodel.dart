import 'package:flutter/cupertino.dart';

class socialaddpostmodel
{
  String?  name;
  String?  dataTime;
  String?  uId;
  String?  postimage;
  String?  text;
  String?  image;


  socialaddpostmodel({
    required this.name,
    required this.dataTime,
    required this.uId,
    required this.postimage,
    required this.text,
    required this.image,
  });
  socialaddpostmodel.fromjson(Map<String,dynamic>json)
  {
    name=json['name'];
    dataTime=json['dataTime'];
    image=json['image'];
    text=json['text'];
    uId=json['uId'];
    postimage=json['postimage'];
  }
  Map<String,dynamic>toMap()
  {
    return  {
      'name':name,
      'image':image,
      'postimage':postimage,
      'uId':uId,
      'dataTime':dataTime,
      'text':text,
    };
  }
}