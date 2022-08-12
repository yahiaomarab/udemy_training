class FavoriteModel
 {
 late final  bool status;
  late final String message;
 late final  Data data;
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
  late final int currentpage;
  late final List<favoritesdata>data;
  late final int from;
 late final  String nextpageurl;
 late final  String firstpageurl;
 late final  String lastpageurl;
  late final int lastpage;
  late final String path;
  late final int perpage;
  late final int to;
 late final  int total;
 late final  String prevpageurl;
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
 late final int id;
 late  final Product product;
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
  late final int id;
  late final dynamic price;
 late final dynamic  oldprice;
  late final int  discount;
  late final String name;
  late final  String image;
 late final  String description;
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


