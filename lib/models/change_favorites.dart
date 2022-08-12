class changefavoritesmodel
{
   bool? status;
   String? message;

  changefavoritesmodel({
    required this.status,
    required this.message,
  });
  changefavoritesmodel.formjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
  }
}


