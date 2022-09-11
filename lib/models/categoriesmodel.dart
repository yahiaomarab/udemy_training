class categoriesmodel
{
  bool? status;
  categoriesdatamodel? data;
   categoriesmodel.fromjson(Map<String,dynamic>json)
   {
     status=json['status'];
     data=categoriesdatamodel.fromjson(json['data']);
   }
}
class categoriesdatamodel
{
int? currentpage;
List<datamodel>?data=[];
categoriesdatamodel.fromjson(Map<String,dynamic>json)
{
  currentpage=json['current_page'];
  data=[];
  json['data'].forEach((element){
    data?.add(new datamodel.fromjson(element));
  });

}
}
class datamodel
{
  int? id;
  String? name;
  String? image;
  datamodel.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}