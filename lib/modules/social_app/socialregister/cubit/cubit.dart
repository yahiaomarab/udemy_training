import 'package:appoo/models/socialuserregister.dart';
import 'package:appoo/modules/social_app/socialregister/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class socialregistappcubit extends Cubit<socialregistappstates>
{
  socialregistappcubit():super(socialintialregisterstate());
  static socialregistappcubit get(context)=>BlocProvider.of(context);
 void socialuserregister(
      {
        required String email,
        required String password,
        required String username,
        required String phone,

      }
      )
  {
    emit(socialregisterloadingstate());
   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password,).then((value){
     createregister(
         email: email, username: username, phone: phone, uId: value.user!.uid,
     );
   }).catchError((erorr){
     emit(socialregistererorrstate(erorr.toString()));
   });
   }

   void createregister(
  {
    required String email,
    required String username,
    required String phone,
    required String uId,
  }
       )
   {
     socialUserRegister model=socialUserRegister
       (
       name: username,
       email:email,
       phone:phone,
       uId:uId,
       image: 'https://scontent.fcai21-1.fna.fbcdn.net/v/t39.30808-6/280265193_1342616946260193_982784802929741640_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFdrFi7OtrlnnDZV2HD-hcXP_PbuiCVJrg_89u6IJUmuDicN6TKekBSpFujJZZZB0QhXOeXtnIJFIC2G5hz7Wjh&_nc_ohc=etuDu24WO74AX9_vLwF&_nc_ht=scontent.fcai21-1.fna&oh=00_AT9rbjzPZwsRi5_l5mKIOhhRRia9mwlTnDSLSrgpaUa9zg&oe=62E76E0F',
       isemailverfied: false,
       bio:'write your bio...',
       cover: 'https://envato-shoebox-0.imgix.net/2555/b050-caa4-4e7d-970c-e6144a76d023/envato19252.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=800&s=0af3f5c0d2b1420da7431fb3bce38aaf',
         );
      FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
        emit(socialcreateuserregistersucessstate());
      }).catchError((erorr){
        emit(socialcreateuserregistererorrstate(erorr.toString()));
      });
   }
  bool bolyian=true;
  IconData suffix=Icons.visibility;
  void changeiconpass()
  {
    bolyian=!bolyian;
    suffix=bolyian? Icons.visibility_off :Icons.visibility;
    emit(socialregistericonchangestate());
  }
}