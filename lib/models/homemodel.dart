class homemodel
{
 late final  bool status;
  late final Homedatamodel data;

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
 late final int id;
 late final String image;

  bannermodel.FromJson(Map<String,dynamic>Json)
  {
    image=Json['image'];
    id=Json['id'];

  }
}
class productsmodel
{
   late final int id;
  late final dynamic price;
late final dynamic oldprice;
 late final int discount;
 late final String name;
 late final String image;
late final bool infavorites;
late final bool incart;

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