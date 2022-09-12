import 'package:appoo/models/userlogin.dart';
import 'package:appoo/modules/register/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class registappcubit extends Cubit<registappstates>
{
  late  Shoploginuser modellogin;
  registappcubit():super(intialregisterstate());
  static registappcubit get(context)=>BlocProvider.of(context);
//  void userregister(
//       {
//         required String email,
//         required String password,
//         required String username,
//         required String phone,
//
//       }
//       )
//   {
//     emit(registerloadingstate());
//     DioHelper.postdata(
//       url: REGISTER,
//       data:
//       {
//         'email':email,
//         'password':password,
//         'phone':phone,
//         'name':username,
//       }
//       ,lang: 'ar',
//     ).then((value) {
//       print(value.data);
//       modellogin=Shoploginuser.FormJson(value.data);
//       print(modellogin.data!.name);
//       emit(registersucessstate(modellogin));
//     }).catchError((erorr){
//       print(erorr.toString());
//       emit(registererorrstate(erorr.toString()));
//     });
//   }
  bool bolyian=true;
  IconData suffix=Icons.visibility;
  void changeiconpass()
  {
    bolyian=!bolyian;
    suffix=bolyian? Icons.visibility_off :Icons.visibility;
    emit(registericonchangestate());
  }
}