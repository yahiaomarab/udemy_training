import 'dart:core';




class Shoploginuser
{
 String?  message;
  bool ? status;
  UserData? data;
Shoploginuser({
  required this.data,
  required this.message,
  required this.status,
});
  Shoploginuser.FormJson( Map<String,dynamic>json)
  {
    message=json['message'];
    status=json['status'];
    data=json['data']!=null?UserData.FormJson(json['data']):null;
  }
}
class UserData
{
      int?     id;
   String? name;
   String? email;
   String? phone;
   String? image;
      int? points;
      int? credits;
   String? token;
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credits,
    required this.token,

  });
  UserData.FormJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credits=json['credits'];
    token=json['token'];

  }
}