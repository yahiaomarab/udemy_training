import 'package:appoo/layout/shop_app/cubit/states.dart';
import 'package:appoo/models/homemodel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/categoriesmodel.dart';
import '../../../models/change_favorites.dart';
import '../../../models/favoritesmodel.dart';
import '../../../models/userlogin.dart';
import '../../../modules/shopapp/categoreisscreen.dart';
import '../../../modules/shopapp/homescreen.dart';
import '../../../modules/shopapp/settingsscreen.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/constants/endpoints.dart';
import '../../../shared/network/remote/dio-helper.dart';

class shopcubit extends Cubit<shopappstate>
{
  shopcubit():super(shopintialstate());
  static shopcubit get(context)=>BlocProvider.of(context);
  int currentindex=0;
 homemodel? homeee;
   categoriesmodel? catmodel;
  FavoriteModel? favormodel;
   changefavoritesmodel? changefavmodel;
  Shoploginuser? profilemodel;
  List<Widget>screenss=[
    homescreen(),
    categoreisscreen(),
    settingsscreen(),
  ];
  Map<int,bool>favorites={};
  void changebottomindex(int index)
  {
    currentindex=index;
    emit(shopbottomnavstate());
  }
  void homedatamodeluser()
  {
    emit(homeloadingstate());
    DioHelper.getdata(
        url: HOME,
      token: token,
    ).then((value)  {
    //  print(value.data);
    //  print(token);
      homeee= homemodel.FromJson(value.data);
     homeee!.data!.products!.forEach((element)
      {
        favorites.addAll({
       element.id!:element.infavorites!,
        });
      });
      print(favorites.toString());
      emit(homesucessstate());
    }).catchError((erorr){

      print(erorr.toString());
      emit(homeerorrstate(erorr.toString()));
    });

  }
  void changefavorites(int product_id)
  {
    favorites[product_id] = ! favorites[product_id]!;
    emit(favoritechangessucessstate());
    DioHelper.postdata(
        url: FAVORITES,
        data: {
          'product_id':product_id,
        },
      token: token,
    ).then((value) {
     changefavmodel=changefavoritesmodel.formjson(value.data);
    /* if(changefavmodel!.status! ==false)
      {
        favorites[product_id]= !favorites[product_id]!;
      }
     */
      emit(favoritessucessstate(changefavmodel!));
    }).catchError((erorr){
      print(erorr.toString());
     favorites[product_id]= !favorites[product_id]!;
      emit(favoriteserorrstate(erorr.toString()));
    });
  }
  void categoriesdatamodeluser()
  {
    DioHelper.getdata(
      url: CATEGORIES,
    ).then((value)  {
     // print(value.data);
      catmodel= categoriesmodel.fromjson(value.data);
      emit(categoriessucessstate());
    }).catchError((erorr){
      print(erorr.toString());
      emit(categorieserorrstate(erorr.toString()));
    });

  }
  void favoritesdatamodeluser()
  {
    DioHelper.getdata(
      url: FAVORITES,
      token: token,
    ).then((value)  {
      favormodel= FavoriteModel.fromjson(value.data);
    //  print(value.data);
      emit(getfavoritessucessstate());
    }).catchError((erorr){
      print(erorr.toString());
      emit(getfavoriteserorrstate(erorr.toString()));
    });

  }
  void profiledatamodeluser()
  {
    DioHelper.getdata(
      url: PROFILE,
      token: token,
    ).then((value)  {
      emit(profileloadingstate());
      profilemodel= Shoploginuser.FormJson(value.data);
      print(profilemodel!.data!.name);
      emit(profilesucessstate(profilemodel!));
    }).catchError((erorr){
      print(erorr.toString());
      emit(profileerorrstate(erorr.toString()));
    });

  }
}