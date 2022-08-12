//import 'package:appoo/layout/shop_app/shop_app.dart';
// import 'package:appoo/modules/login/cubit/cubit.dart';
// import 'package:appoo/modules/login/cubit/states.dart';
// import 'package:appoo/modules/register/socialregister.dart';
// import 'package:appoo/shared/network/local/cacah_helper.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../shared/component/component.dart';
//
// class shoplogin extends StatelessWidget
// {
//   var emailshopcontroller=TextEditingController();
//   var passshopcontroller=TextEditingController();
//   var formkey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//
//       create: (BuildContext context) {return logappcubit(); },
//
//       child: BlocConsumer<logappcubit,logappstates>(
//         listener: (context,state){
//           if( state is loginsucessstate)
//            // {
//           //              if(state.modellogin.status)
//           //                {
//           //
//           //                  print(state.modellogin.message);
//           //                  toastmassage(massege: '${state.modellogin.message}', state: ToastState.Sucess);
//           //                  cachehelper.savedata(key: 'token', value: state.modellogin.data!.token);
//           //                  print(state.modellogin.data!.token);
//           //                 navandreplace(context, shopapp());
//           //
//           //                }else
//           //                  {
//           //                    print(state.modellogin.message);
//           //                    toastmassage(massege: '${state.modellogin.message}', state: ToastState.Erorr);
//           //                  }
//           //             }
//        // },
//         builder: (context,state){
//           return  Scaffold(
//             appBar: AppBar(),
//             body:Padding(
//               padding: const EdgeInsets.all(40.0),
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: formkey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//
//                                     Text(
//                                       'Login',
//                                       style:TextStyle(
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.bold,                                    ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Text(
//                                       'Register now to browse our hot offers',
//                                       style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey[400],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 80,
//                                     ),
//                                     formfield(
//                                       controller: emailshopcontroller,
//                                       prefix: Icons.email,
//                                       type: TextInputType.emailAddress,
//                                       text: 'Email',
//                                       validate: (String? value){
//                                         if(value!.isEmpty)
//                                         {
//                                           return 'email adress must not be written' ;
//                                         }
//                                         else
//                                         {
//                                           return null;
//                                         }
//                                       },
//                                     ),
//                                     SizedBox(
//                                       height:15 ,
//                                     ),
//                                     formfield(
//                                       controller: passshopcontroller,
//                                       prefix: Icons.password,
//                                       type: TextInputType.visiblePassword,
//                                       text: 'Password',
//                                       ispassword: logappcubit.get(context).bolyian,
//                                       validate: (String? value){
//                                         if(value!.isEmpty)
//                                         {
//                                           return 'pass adress must not be written' ;
//                                         }
//                                         else
//                                         {
//                                           return null;
//                                         }
//                                       },
//                                       suefix: logappcubit.get(context).suffix,
//                                          suffixpressed: ()
//                                         {
//                                           logappcubit.get(context).changeiconpass();
//                                         }
//
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                     ConditionalBuilder(
//                                       condition: state is!loginloadingstate,
//                                       builder: (context)=>button(
//                                         x: 50,
//                                         text: 'login',
//                                         OnPressed: (){
//                                           if(formkey.currentState!.validate()){
//                                             logappcubit.get(context).userlogin
//                                               (
//                                               email: emailshopcontroller.text,
//                                               password: passshopcontroller.text,
//                                             );
//                                           }
//
//                                         },
//                                       ),
//                                       fallback:(context) =>Center(child: CircularProgressIndicator()),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Text('Dont have an account?'),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         TextButton(
//                                           onPressed: (){
//                                             navto(context, register());
//                                           },
//                                           child: Text(
//                                             'REGISTER',
//                                             style: TextStyle(
//                                                 color: Colors.pink
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                     ),
//                   ),
//                 ),
//
//             ),
//           );
//         },
//
//       ),
//     );
//   }
//
// }