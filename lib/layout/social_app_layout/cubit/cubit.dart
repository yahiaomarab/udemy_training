import 'dart:io';

import 'package:appoo/layout/social_app_layout/cubit/states.dart';
import 'package:appoo/modules/social_app/feeds_social_screen/feeds_social_screen.dart';
import 'package:appoo/modules/social_app/settings_social_screen/social_settings_screen.dart';
import 'package:appoo/modules/social_app/social_addpost_screen/social_addpost_screen.dart';
import 'package:appoo/modules/social_app/social_chats_screen/chats_screen.dart';
import 'package:appoo/modules/social_app/social_users_screen/social_user_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/social_addingpostmodel.dart';
import '../../../models/socialuserregister.dart';
import '../../../shared/constants/constants.dart';


class socialappcubit extends Cubit<socialappstates>
{
  socialappcubit():super(socialinitialappstate());
  static socialappcubit get(context)=>BlocProvider.of(context);
    socialUserRegister? usermodel;
   void getUserData()
   {
     emit(socialgetuserloadingstate());
     FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
       print(value.data());
       usermodel=socialUserRegister.fromjson(value.data()!);
       emit(socialgetusersucessstate());
     }).catchError((erorr){
       emit(socialgetusererorrstate(erorr.toString()));
     });
   }
   int currentindex=0;
   List<Widget>screens=
       [
         social_feeds_screen(),
         social_chats_screen(),
         social_addpost_screen(),
         social_users_screen(),
         social_settings_screen(),
       ];
  List<String>titles=
  [
    'News Feed',
    'cahts',
    'post',
    'friends',
    'settings',

  ];
   void changebottomnavigatioonitem(int index)
   {
     if(index==2)
       emit(socialaddpoststate());
     else{
       currentindex=index;
       emit(socialchangebottomnavstate());
     }

   }
   File? profileimage;
   var picker=ImagePicker();
   Future<void>getprofileimage()async
   {
   var pickedfile=await picker.pickImage(
       source: ImageSource.gallery,
   );
   if(pickedfile != null)
   {
       profileimage=File(pickedfile.path);
       emit(socialprofileimagepickedsucessstate());
   }else
     {
       print('no photo selected');
       emit(socialprofileimagepickederorrstate());
     }
   }
  File? coverimage;

  Future<void>getcoverimage()async
  {
    var pickedfile=await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedfile != null)
    {
      coverimage=File(pickedfile.path);
      emit(socialcoverimagepickedsucessstate());
    }else
    {
      print('no photo selected');
      emit(socialcoverimagepickederorrstate());
    }
  }

  void uploadprofileimage(
       {
         required String name,
         required String phone,
         required String bio,
       }
       )
      {
     emit(socialUpdateuserloadingstate());
     FirebaseStorage.instance.ref()
              .child('users/${Uri.file(profileimage!.path).pathSegments.last}')./// get link of profile image to handle it and download the url
     putFile(profileimage!).then((value) {
       value.ref.getDownloadURL().then((value) {
         print(value);
         updateuserdata(name: name, phone: phone, bio: bio,image: value);
        // emit(socialuploadprofileimagesucessstate());
       }).catchError((erorr){  emit(socialuploadprofileimageerorrstate());});
          }).catchError((erorr){  emit(socialuploadprofileimageerorrstate());});
   }

   void uploadcoverimage(
   {
     required String name,
     required String phone,
     required String bio,
 }
       )
   {
     emit(socialUpdateuserloadingstate());
      FirebaseStorage.instance.ref('users/')
         .child('users/${Uri.file(coverimage!.path).pathSegments.last}').
     putFile(coverimage!).then((value) {
       value.ref.getDownloadURL().then((value) {
        updateuserdata(name: name, phone: phone, bio: bio,cover: value);
         //emit(socialuploadcoverimagesucessstate());
       }).catchError((erorr){  emit(socialuploadcoverimageerorrstate());});
     }).catchError((erorr){  emit(socialuploadcoverimageerorrstate());});
   }

  Future<void>  updateuserdata(
       {
         required String name,
         required String phone,
         required String bio,
         String? image,
         String? cover,
       }
       )async
       {
     socialUserRegister model=socialUserRegister
       (
       name: name,
       email:usermodel!.email,
       phone:phone,
       uId:usermodel!.uId,
       image:image?? usermodel!.image,
       isemailverfied: false,
       bio:bio,
       cover:cover?? usermodel!.cover,
     );
   await  FirebaseFirestore.instance.collection('users').doc(usermodel?.uId).update(model.toMap()).then((value) {///update all model because i might change name or bio or ,,,etc,
       //emit(socialUpdateusersucessstate());
       getUserData();
     }).catchError((erorr){});
     emit(socialUpdateusererorrstate());
   }
  File? postimage;
  Future<void>getpostimage()async
  {
    var pickedfile=await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedfile != null)
    {
      postimage=File(pickedfile.path);
      emit(socialaddpostimagepikedsucessstate());
    }else
    {
      print('no photo selected');
      emit(socialaddpostimagepikederorrstate());
    }
  }
  void uploadpostimage(
      {
        required String dataTime,
        required String text,
      }
      )
  {
    emit(socialcreatepostloadingstate());
    FirebaseStorage.instance.ref('posts/')
        .child('posts/${Uri.file(postimage!.path).pathSegments.last}').
    putFile(postimage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        createpost(dataTime: dataTime, text: text,postimage: value);
        print(value);
      }).catchError((erorr){  emit(socialcreateposterorrstate());});
    }).catchError((erorr){  emit(socialcreateposterorrstate());});
  }
  void createpost(
      {
        required String dataTime,
        required String text,
         String? postimage,
      }
      )
  {
    emit(socialcreatepostloadingstate());
    socialaddpostmodel model=socialaddpostmodel
      (
      name: usermodel!.name,
      text:text,
      uId:usermodel!.uId,
      image: usermodel!.image,
      dataTime:dataTime,
      postimage:postimage?? '',
    );
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      emit(socialcreatepostsucessstate());

    }).catchError((erorr){});
    emit(socialcreateposterorrstate());
  }
  void removeimage()
  {
    postimage=null;
    emit(socialclosepostimagestate());
  }
  List<socialaddpostmodel>posts=[];
  void getposts()
  {
      FirebaseFirestore.instance
          .collection('posts')
          .get().then((value)
      {
            value.docs.forEach((element) {
              element.reference
              .collection('likes/')
              .get()
              .then((value) {
                postlikes.add(value.docs.length);
                postid.add(element.id);
                posts.add(socialaddpostmodel.fromjson(element.data()));
              })
              .catchError((erorr){});
            });
            emit(socialgetpostssucessstate());
      })
          .catchError((erorr){
            emit(socialgetpostserorrstate(erorr.toString()));
      });
  }
  List<String>postid=[];
  List<int>postlikes=[];
  void getpostslikes(String postId)
  {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes/')
        .doc(usermodel!.uId)
        .set(
        {
          'like': true,
        })
        .then((value) {
          emit(socialgetpostlikesucessstate());
    })
        .catchError((erorr){
      emit(socialgetpostlikeerorrstate(erorr.toString()));

    });
  }

}
