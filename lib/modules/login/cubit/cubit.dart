import 'package:appoo/models/userlogin.dart';
import 'package:appoo/modules/login/cubit/states.dart';
import 'package:appoo/shared/constants/endpoints.dart';
import 'package:appoo/shared/network/remote/dio-helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constants/constants.dart';

class logappcubit extends Cubit<logappstates>
{
late  Shoploginuser modellogin;
  logappcubit():super(intialloginstate());
  static logappcubit get(context)=>BlocProvider.of(context);
  void userlogin(
  {
  required String email,
    required String password,
}
      )
  {
    emit(loginloadingstate());
    DioHelper.postdata(
        url: Login,
        data:
        {
       'email':email,
       'password':password,
        },
      lang: 'ar',
      token: token,
    ).then((value) {
      print(value.data);
   modellogin=Shoploginuser.FormJson(value.data);
   print(modellogin.data!.name);
      emit(loginsucessstate());
    }).catchError((erorr){
      print(erorr.toString());
      emit(loginerorrstate(erorr.toString()));
    });
  }
  bool bolyian=true;
  IconData suffix=Icons.visibility_off;
  void changeiconpass()
  {
    bolyian=!bolyian;
    suffix=bolyian? Icons.visibility_off :Icons.visibility;
    emit(loginiconchangestate());
  }
}