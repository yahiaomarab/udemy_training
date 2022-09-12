import 'package:appoo/layout/social-app/cubit/cubit.dart';
import 'package:appoo/models/message_model.dart';
import 'package:appoo/models/socialuserregister.dart';
import 'package:appoo/shared/styles/colors.dart';
import 'package:appoo/shared/styles/icon-broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/social-app/cubit/states.dart';


class chat_deatails_screen extends StatelessWidget
{
  var messagecontroller=TextEditingController();
  socialUserRegister usermodel;
  chat_deatails_screen({required this.usermodel});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context)
      {
        socialappcubit.get(context).getmessage(recevierId: usermodel.uId!);
        return BlocConsumer<socialappcubit,socialappstates>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(usermodel.image!),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      usermodel.name!,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100
                      ),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition:socialappcubit.get(context).message.length>0 ,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context,index){
                            var message=socialappcubit.get(context) .message[index];
                            if(socialappcubit.get(context).usermodel!.uId!=message.senderId!)
                            {
                              return buildmymessage(message);
                            }
                            else
                            {
                              return buildmessage(message) ;
                            }
                          },
                          separatorBuilder: (context,index)=>SizedBox(
                            height:15,
                          ),
                          itemCount: socialappcubit.get(context).message.length,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: messagecontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'type your message here....',

                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){
                                socialappcubit.get(context).sendmessage(
                                  recevirId: usermodel.uId!,
                                  text: messagecontroller.text,
                                  datatime: DateTime.now().toString(),
                                );
                              },
                              minWidth: 1,
                              child:Icon( IconBroken.Send,color:dafultcolor),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
            );
          },

        );
      },
    );
  }
  Widget buildmessage(messagemodel model)
  {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
              bottomEnd: Radius.circular(10),

            )
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Text('${model.text}'),
      ),
    );
  }
  Widget buildmymessage(messagemodel model)
  {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
            color:Colors.pink.withOpacity(0.2), //Colors.pink[200],
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
              bottomStart: Radius.circular(10),

            )
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Text('${model.text}'),
      ),
    );
  }
}