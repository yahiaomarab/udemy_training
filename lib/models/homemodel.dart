class homemodel
{
 bool? status;
 Homedatamodel? data;

   homemodel.FromJson(Map<String,dynamic>Json)
   {
     status=Json['status'];
     data =Homedatamodel.FromJson(Json['data']);
   }
}
class Homedatamodel
{
  List<bannermodel>?banners=[];
  List<productsmodel>?products=[];
Homedatamodel.FromJson(Map<String,dynamic>Json)
{
  banners=[];
  Json['banners'].forEach((element){
    banners?.add( bannermodel.FromJson(element));
  });
  products=[];
  Json['products'].forEach((element){
    products?.add( productsmodel.FromJson(element));
  });
}
}
class bannermodel
{
  int? id;
  String? image;

  bannermodel.FromJson(Map<String,dynamic>Json)
  {
    image=Json['image'];
    id=Json['id'];

  }
}
class productsmodel
{
      int?   id;
  dynamic?   price;
  dynamic?   oldprice;
      int?   discount;
   String?   name;
   String?   image;
     bool?   infavorites;
     bool?   incart;

  productsmodel.FromJson(Map<String,dynamic>Json)
  {
    id=Json['id'];
    price=Json['price'];
    oldprice=Json['old_price'];
    discount=Json['discount'];
    name=Json['name'];
    image=Json['image'];
    infavorites=Json['in_favorites'];
    incart=Json['in_cart'];

  }
}