import 'package:appoo/modules/social_app/social_login_app/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sociallogappcubit extends Cubit<sociallogappstates>
{
  sociallogappcubit():super(socialintialloginstate());
  static sociallogappcubit get(context)=>BlocProvider.of(context);
 void userlogin(
      {
        required String email,
        required String password,
      }
      )
  {
    emit(socialloginloadingstate());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password,
    ).then((value) {
      emit(socialloginsucessstate(value.user!.uid));
    }).catchError((erorr){
      emit(socialloginerorrstate(erorr.toString()));
    });
  }
  bool bolyian=true;
  IconData suffix=Icons.visibility_off;
  void changeiconpass()
  {
    bolyian=!bolyian;
    suffix=bolyian? Icons.visibility_off :Icons.visibility;
    emit(socialloginiconchangestate());
  }
}