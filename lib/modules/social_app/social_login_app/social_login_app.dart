import 'package:appoo/modules/social_app/social_login_app/cubit/cubit.dart';
import 'package:appoo/shared/network/local/cacah_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/social_app_layout/social_app_layout.dart';
import '../../../shared/component/component.dart';
import '../socialregister/socialregister.dart';
import 'cubit/states.dart';

class sociallogin extends StatelessWidget
{
  var emailshopcontroller=TextEditingController();
  var passshopcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>sociallogappcubit(),
      child: BlocConsumer<sociallogappcubit,sociallogappstates>(
        listener: (context,state){
          if (state is socialloginerorrstate)
            {
              toastmassage(
                  massege: state.erorr,
                  state: ToastState.Erorr
              );
            }
          else if(state is socialloginsucessstate)
            {
              cachehelper.savedata(key: 'uId', value: state.uId).then((value) {
                toastmassage(
                  massege: 'تم تسجيل الدخول بنجاح',
                  state: ToastState.Sucess,
                );
                navandreplace(context, socialapp());
              });
            }
        },
        builder:(context,state)=>  Scaffold(
          appBar: AppBar(),
          body:Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Text(
                      'Login',
                      style:TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,                                    ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Login now to communication with your friends',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    formfield(
                      controller: emailshopcontroller,
                      prefix: Icons.email,
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
                      height:15 ,
                    ),
                    formfield(
                        controller: passshopcontroller,
                        prefix: Icons.password,
                        type: TextInputType.visiblePassword,
                        text: 'Password',
                        ispassword: sociallogappcubit.get(context).bolyian,
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
                        suefix: sociallogappcubit.get(context).suffix,
                        suffixpressed: ()
                        {
                          sociallogappcubit.get(context).changeiconpass();
                        }

                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ConditionalBuilder(
                      condition: state is!socialloginloadingstate,
                      builder: (context)=>button(
                        x: 50,
                        text: 'login',
                        OnPressed: (){
                          if(formkey.currentState!.validate()){
                            sociallogappcubit.get(context).userlogin
                              (
                              email: emailshopcontroller.text,
                              password: passshopcontroller.text,
                            );
                          }

                        }, width: double.infinity,
                      ),
                      fallback:(context) =>Center(child: CircularProgressIndicator()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account?'),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: (){
                            navto(context, socialregister());
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Colors.blue[300]
                            ),
                          ),
                        ),
                      ],
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
