class Shoploginuser
{
 String? message;
 late bool status;
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
  late final int id;
  late final  String name;
 late final   String email;
 late final   String phone;
  late final   String image;
  late final   int points;
  late final   int credits;
  late final String token;
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