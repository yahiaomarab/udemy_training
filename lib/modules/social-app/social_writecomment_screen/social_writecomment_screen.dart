import 'package:appoo/shared/styles/icon-broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/social-app/cubit/cubit.dart';
import '../../../layout/social-app/cubit/states.dart';
import '../../../shared/component/component.dart';

class social_writecomment_screen extends StatelessWidget
{
  var textcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialappcubit,socialappstates>(
      listener: (context,state){},
      builder:(context,state){
        return   Scaffold(
          appBar: buildappbar(
            context: context,
            title: 'comment',

          ),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is socialcreatecommentloadingstate)
                  LinearProgressIndicator(),
                if(state is socialcreatecommentloadingstate)
                  SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('${socialappcubit.get(context).usermodel!.image}'),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Yahia omar',style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      hintText: 'write a comment....',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          socialappcubit.get(context).getpostimage();
                        },
                        child:Row(
                          children: [
                            Icon(Icons.image),
                            SizedBox(
                              width: 5,
                            ),
                            Text('add photo',style: TextStyle(fontSize: 20),),
                          ],
                        ) ,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child:IconButton(icon: Icon(IconBroken.Send), onPressed: () {
                          socialappcubit.get(context).createcomment(
                            dataTime: DateTime.now().toString(),
                            text: textcontroller.text,
                          );
                        },),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      },

    );
  }

}
