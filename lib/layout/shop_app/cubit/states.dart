import 'package:appoo/models/change_favorites.dart';

import '../../../models/userlogin.dart';


abstract class shopappstate{}
class shopintialstate extends shopappstate{}
class shopbottomnavstate extends shopappstate{}
class homeloadingstate extends shopappstate{}
class homesucessstate extends shopappstate{

}
class homeerorrstate extends shopappstate{
  final String erorr;

  homeerorrstate(this.erorr);

}
class changefavbuttonstate extends shopappstate{}
class categoriessucessstate extends shopappstate{

}
class categorieserorrstate extends shopappstate{
  final String erorr;

  categorieserorrstate(this.erorr);

}
class favoritessucessstate extends shopappstate{
 final changefavoritesmodel changefavmodel;
  favoritessucessstate(this.changefavmodel);

}
class favoriteserorrstate extends shopappstate{
  final String erorr;

  favoriteserorrstate(this.erorr);

}
class favoritechangessucessstate extends shopappstate{}
class getfavoritessucessstate extends shopappstate{

}
class getfavoriteserorrstate extends shopappstate{
  final String erorr;

  getfavoriteserorrstate(this.erorr);

}
class profileloadingstate extends shopappstate{}
class profilesucessstate extends shopappstate{
final Shoploginuser profilemodel;

  profilesucessstate(this.profilemodel);
}
class profileerorrstate extends shopappstate{
  final String erorr;

  profileerorrstate(this.erorr);

}