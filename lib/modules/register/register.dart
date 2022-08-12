import 'package:appoo/modules/register/cubit/cubit.dart';
import 'package:appoo/shared/network/local/cacah_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/shop_app/shop_app.dart';
import '../../shared/component/component.dart';
import 'cubit/states.dart';

class register extends StatelessWidget
{
  var emailshopcontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var usernamecontroller=TextEditingController();
  var passshopcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) {return registappcubit(); },
     child: BlocConsumer<registappcubit,registappstates>(
       listener:(context,state){
         if( state is registersucessstate)
         {
           if(state.modellogin.status!)
           {
             print(state.modellogin.data!.token);
             print(state.modellogin.message);
             toastmassage(massege: '${state.modellogin.message}', state: ToastState.Sucess);
             cachehelper.savedata(key: 'token', value: state.modellogin.data!.token);
             navandreplace(context, shopapp());

           }else
           {
             print(state.modellogin.message);
             toastmassage(massege: '${state.modellogin.message}', state: ToastState.Erorr);
           }
         }
       } ,
       builder:(context,state) =>
           Scaffold(
             appBar: AppBar(),
             body: Padding(
               padding: const EdgeInsets.all(35.0),
               child: SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                 child: Form(
                   key: formkey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'REGISTER',
                         style: TextStyle(
                           fontSize: 40,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       Text(
                         'Register now to browse our hot offers',
                         style: TextStyle(
                           fontSize: 25,
                           fontWeight: FontWeight.bold,
                           color: Colors.grey[400],
                         ),
                       ),
                       SizedBox(
                         height: 35,
                       ),
                       formfield(
                         controller: usernamecontroller,
                         prefix: Icons.person,
                         type: TextInputType.text,
                         text: 'User Name',
                         validate: (String? value){
                           if(value!.isEmpty)
                           {
                             return 'user name must not be written' ;
                           }
                           else
                           {
                             return null;
                           }
                         },
                       ),
                       SizedBox(
                         height: 35,
                       ),
                       formfield(
                         controller: emailshopcontroller,
                         prefix: Icons.email_outlined,
                         type: TextInputType.emailAddress,
                         text: 'Email',
                         validate: (String? value){
                           if(value!.isEmpty)
                           {
                             return 'email adress must not be written' ;
                           }
                           else
                           {
                             return null;
                           }
                         },
                       ),
                       SizedBox(
                         height: 35,
                       ),
                       formfield(
                           controller: passshopcontroller,
                           prefix: Icons.password,
                           type: TextInputType.visiblePassword,
                           text: 'Password',
                           ispassword: registappcubit.get(context).bolyian,
                           validate: (String? value){
                             if(value!.isEmpty)
                             {
                               return 'pass adress must not be written' ;
                             }
                             else
                             {
                               return null;
                             }
                           },
                           suefix:registappcubit.get(context).suffix,
                           suffixpressed: ()
                           {
                             registappcubit.get(context).changeiconpass();
                           }

                       ),
                       SizedBox(
                         height: 35,
                       ),
                       formfield(
                         controller: phonecontroller,
                         prefix: Icons.phone,
                         type: TextInputType.phone,
                         text: 'Phone Number',
                         validate: (String? value){
                           if(value!.isEmpty)
                           {
                             return 'phone number must not be written' ;
                           }
                           else
                           {
                             return null;
                           }
                         },
                       ),
                       SizedBox(
                         height:50 ,
                       ),
                       ConditionalBuilder(
                         condition: state is! registerloadingstate,
                         builder:(context)=> button(
                             x: 50,
                             text: 'Register',
                             OnPressed: (){
                               if(formkey.currentState!.validate()){
                                // registappcubit.get(context).userregister
                                 //                                    (
                                 //                                    email: emailshopcontroller.text,
                                 //                                    password: passshopcontroller.text,
                                 //                                    phone: phonecontroller.text,
                                 //                                    username: usernamecontroller.text,
                                 //                                  );
                               }
                             }, width: double.infinity,

                         ),
                         fallback: (context)=>Center(child: CircularProgressIndicator(),),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ),
     ),
   );
  }

}
