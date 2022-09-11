
class FavoriteModel
 {
    bool? status;
   String? message;
    Data? data;
   FavoriteModel({
      required this.status,
      required this.message,
      required this.data,
   });
   FavoriteModel.fromjson(Map<String,dynamic>json)
   {
     status=json['status'];
     message=json['message'];
     data = Data.fromjson(json['data']);
   }
}
 class Data
 {
  int? currentpage;
  List<favoritesdata>?data;
  int? from;
  String? nextpageurl;
  String? firstpageurl;
  String? lastpageurl;
  int? lastpage;
  String? path;
  int? perpage;
  int? to;
  int? total;
  String? prevpageurl;
  Data({
   required this.currentpage,
   required this.data,
   required this.firstpageurl,
   required this.from,
   required this.lastpage,
   required this.lastpageurl,
   required this.nextpageurl,
   required this.path,
   required this.perpage,
   required  this.prevpageurl,
   required this.to,
   required this.total,
   });
  Data.fromjson(Map<String, dynamic> json){
     currentpage = json['current_page'];
     data = List.from(json['data']).map((e)=>favoritesdata.fromjson(e)).toList();
    firstpageurl = json['first_page_url'];
    from = json['from'];
     lastpage = json['last_page'];
     lastpageurl = json['last_page_url'];
     nextpageurl = json['next_page_url'];
     path = json['path'];
    perpage = json['per_page'];
     prevpageurl = json['prev_page_url'];
     to = json['to'];
     total = json['total'];
   }
 }
 class favoritesdata
 {
 int? id;
  Product? product;
 favoritesdata({
   required this.id,
   required this.product,
 });
   favoritesdata.fromjson(Map<String,dynamic>json)
   {
     id=json['id'];
     product=Product.fromjson(json['product']);
   }
 }
 class Product
 {
      int?  id;
  dynamic?  price;
  dynamic?   oldprice;
      int?   discount;
   String?  name;
   String?  image;
   String?  description;
 Product({
   required this.id,
   required this.price,
   required this.oldprice,
   required this.discount,
   required this.name,
   required this.image,
   required this.description,
 });
   Product.fromjson(Map<String,dynamic>json)
{
     id=json['id'];
     price=json['price'];
     oldprice=json['oldprice'];
     discount=json['discount'];
     name=json['name'];
     image=json['image'];
     description=json['description'];
   }
 }


