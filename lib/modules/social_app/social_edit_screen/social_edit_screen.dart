import 'package:appoo/layout/social_app_layout/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/social_app_layout/cubit/states.dart';
import '../../../shared/component/component.dart';

class social_edit_screen extends StatelessWidget
{
  var NameController =TextEditingController();
  var BioController =TextEditingController();
  var PhoneController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialappcubit,socialappstates>(
      listener: (context,state){},
      builder: (context,state){
        var usermodel=socialappcubit.get(context).usermodel;
        var profileimage=socialappcubit.get(context).profileimage;
        var coverimage=socialappcubit.get(context).coverimage;
       NameController.text=usermodel!.name!;
       BioController.text=usermodel.bio!;
       PhoneController.text=usermodel.phone!;
        return Scaffold(
          appBar: buildappbar(
              context: context,
              title: 'Edit Profile',
              actions:[
                TextButton(
                    onPressed: (){
           socialappcubit.get(context).updateuserdata(
                                       name: NameController.text,
                                       phone: PhoneController.text,
                                       bio: BioController.text,
                                   );

                },
                    child: Text('UPDATE')),
              ]
          ),
          body: SingleChildScrollView(
           physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                if(state is socialUpdateuserloadingstate)
                   LinearProgressIndicator(),
                if(state is socialUpdateuserloadingstate)
                   SizedBox(
                    height: 5,
                  ),
                Container(
                    height: 240,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment:AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    image: DecorationImage(
                                      image:coverimage ==null? NetworkImage(
                                          '${usermodel.cover}'
                                      ):FileImage(coverimage)as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                ),

                              ),
                              IconButton(
                                  onPressed: (){
                                    socialappcubit.get(context).getcoverimage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.blue,
                                    child: Icon(
                                Icons.camera_alt_outlined,
                                      size: 18,
                                      color: Colors.white,
                              ),
                                  ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child:CircleAvatar(
                                radius: 60,
                                backgroundImage: (profileimage == null)? NetworkImage(
                                    '${usermodel.image}'
                                ):FileImage(profileimage)as ImageProvider,

                              ) ,
                            ),
                            IconButton(
                              onPressed: (){
                                socialappcubit.get(context).getprofileimage();
                              },
                              icon: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                    height: 20,
                  ),
                  if(socialappcubit.get(context).profileimage!=null || socialappcubit.get(context).coverimage!=null)
                   Row(
                    children: [
                      if(socialappcubit.get(context).profileimage!=null)
                        Expanded(
                            child: Column(
                              children: [
                                button(x: 40, text: 'update profile', OnPressed: (){
                                 socialappcubit.get(context).uploadprofileimage(name: NameController.text, phone: PhoneController.text, bio: BioController.text);
                                }, width: double.infinity),
                                if(state is socialUpdateuserloadingstate)
                                SizedBox(
                                  height: 3,
                                ),
                                if(state is socialUpdateuserloadingstate)
                                 LinearProgressIndicator(),
                              ],
                            )
                        ),
                      SizedBox(
                        width: 5,
                      ),
                      if(socialappcubit.get(context).coverimage!=null)
                        Expanded(
                            child: Column(
                              children: [
                                button(x: 40, text: 'update cover', OnPressed: (){
                                  socialappcubit.get(context).uploadcoverimage(name: NameController.text, phone: PhoneController.text, bio: BioController.text);
                                }, width: double.infinity),
                                if(state is socialUpdateuserloadingstate)
                                 SizedBox(
                                  height: 3,
                                ),
                                if(state is socialUpdateuserloadingstate)
                                 LinearProgressIndicator(),
                              ],
                            )
                        ),
                    ],
                  ),
                  if(socialappcubit.get(context).profileimage!=null || socialappcubit.get(context).coverimage!=null)
                    SizedBox(
                      height: 10,
                    ),
                formfield(
                      controller: NameController,
                      prefix: Icons.supervised_user_circle_outlined,
                      type: TextInputType.name,
                      text: 'Name',
                      validate: ( value)
                    {
                      if(value.isEmpty)
                        {
                          return 'Name must not be empty';
                        }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  formfield(
                    controller: BioController,
                    prefix: Icons.info_outline,
                    type: TextInputType.text,
                    text: 'Bio',
                    validate: ( value)
                    {
                      if(value.isEmpty)
                      {
                        return 'Bio must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  formfield(
                    controller: PhoneController,
                    prefix: Icons.phone,
                    type: TextInputType.phone,
                    text: 'Phone',
                    validate: ( value)
                    {
                      if(value.isEmpty)
                      {
                        return 'Phone number must not be empty';
                      }
                      return null;
                    },
                  ),


                ],
              ),
            ),
          ),
        );
      },

    );
  }

}