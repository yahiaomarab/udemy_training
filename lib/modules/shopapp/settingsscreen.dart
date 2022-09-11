import 'package:appoo/layout/shop_app/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/shop_app/cubit/states.dart';
import '../../shared/component/component.dart';

class settingsscreen extends StatelessWidget
{
  var updatekey=GlobalKey<FormState>();
  var namecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<shopcubit,shopappstate>(
         listener: (context,state){
           if(state  is profilesucessstate)
             {
               namecontroller.text=state.profilemodel.data!.name!;
               emailcontroller.text=state.profilemodel.data!.email!;
               phonecontroller.text=state.profilemodel.data!.phone!;
             }
         },
         builder: (context,state) {
          // var model=shopcubit.get(context).profilemodel;
          //  namecontroller.text=model!.data!.name;
         //   emailcontroller.text=model.data!.email;
         //   phonecontroller.text=model.data!.phone;
        return   ConditionalBuilder(
             condition: shopcubit
                 .get(context)
                 .profilemodel != null,
             builder: (context) =>
                 Padding(
                   padding: const EdgeInsets.all(30),
                   child: SingleChildScrollView(
                     physics: BouncingScrollPhysics(),
                     child: Form(
                       key: updatekey,
                       child: Column(
                         children: [
                           formfield(
                             controller: namecontroller,
                             prefix: Icons.person,
                             type: TextInputType.text,
                             text: 'User Name',
                             validate: (String? value) {
                               if (value!.isEmpty) {
                                 return 'user name must not be written';
                               }
                               else {
                                 return null;
                               }
                             },
                           ),
                           SizedBox(
                             height: 35,
                           ),
                           formfield(
                             controller: emailcontroller,
                             prefix: Icons.email_outlined,
                             type: TextInputType.emailAddress,
                             text: 'Email',
                             validate: (String? value) {
                               if (value!.isEmpty) {
                                 return 'email adress must not be written';
                               }
                               else {
                                 return null;
                               }
                             },
                           ),
                           SizedBox(
                             height: 35,
                           ),


                           formfield(
                             controller: phonecontroller,
                             prefix: Icons.phone,
                             type: TextInputType.phone,
                             text: 'Phone Number',
                             validate: (String? value) {
                               if (value!.isEmpty) {
                                 return 'phone number must not be written';
                               }
                               else {
                                 return null;
                               }
                             },
                           ),
                           SizedBox(
                             height: 50,
                           ),
                           button(
                             x: 40,
                             text: 'UPDATE', OnPressed: () {}, width: double.infinity,
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           button(
                             x: 40,
                             text: 'LOGOUT', OnPressed: () {}, width: double.infinity,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
             fallback: (context) => Center(child: CircularProgressIndicator()),

           );
         },
       );
  }

}