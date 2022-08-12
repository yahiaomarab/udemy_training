import 'dart:io';

import 'package:appoo/shared/component/component.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class firestorage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    File? coverimage;
    var picker=ImagePicker();


    Future<void>getcoverimage()async
    {
      var pickedfile=await picker.pickImage(
        source: ImageSource.gallery,
      );
      if(pickedfile != null)
      {
        coverimage=File(pickedfile.path);

      }else
      {
        print('no photo selected');

      }
    }
    void uploadcoverimage()
    {
      FirebaseStorage.instance.ref()
          .child('users/${Uri.file(coverimage!.path).pathSegments.last}').
      putFile(coverimage!).then((value) {
        value.ref.getDownloadURL().then((value) {
          print(value);
        }).catchError((erorr){  });
      }).catchError((erorr){ });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
             button(x: 40, text: 'press',
                  OnPressed: ()
                  {
                    uploadcoverimage();
                  },
                  width: 100),

            button(x: 40, text: 'uploadphoto',
                OnPressed: (){
              getcoverimage();
            },
                width: 100)
          ],
        ),
      ),
    );
  }

}