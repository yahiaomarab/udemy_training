class socialUserRegister
{
 String?  name;
 String?  phone;
 String?  uId;
 String?   email;
   bool?  isemailverfied;
 String?   image;
 String?   cover;
 String?  bio;
  socialUserRegister({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.image,
    required this.cover,
    required this.bio,
    required this.isemailverfied,
  });
  socialUserRegister.fromjson(Map<String,dynamic>json)
  {
    name=json['name'];
    bio=json['bio'];
    image=json['image'];
    phone=json['phone'];
    uId=json['Uid'];
    email=json['email'];
    cover=json['cover'];
    isemailverfied=json['isemailverfied'];
  }
  Map<String,dynamic>toMap()
  {
     return  {
       'name':name,
       'cover':cover,
       'phone':phone,
       'uId':uId,
       'email':email,
       'image':image,
       'isemailverfied':isemailverfied,
       'bio':bio,
     };
  }
}