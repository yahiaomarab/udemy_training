import 'package:appoo/layout/social_app_layout/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/social_app_layout/cubit/states.dart';
import '../../../shared/component/component.dart';

class social_addpost_screen extends StatelessWidget
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
            title: 'Create Post',
            actions: [
              TextButton(
                onPressed: (){
                  if(socialappcubit.get(context).postimage==null)
                    {
                      socialappcubit.get(context).createpost(dataTime: DateTime.now().toString(), text: textcontroller.text);

                    }else
                      {
                        socialappcubit.get(context).uploadpostimage(dataTime: DateTime.now().toString(), text: textcontroller.text);
                      }
                },
                child: Text('Post',style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is socialcreatepostloadingstate)
                  LinearProgressIndicator(),
                if(state is socialcreatepostloadingstate)
                  SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://envato-shoebox-0.imgix.net/e14a/5cc1-8fd3-4ae2-9998-ee9cb2548c18/envato12558.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=800&s=f7b50793dd129bc5f58bd18f6a50b6f1'
                      ),
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
                      hintText: 'what is on your mind....?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if(socialappcubit.get(context).postimage!=null)
                 Stack(
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
                          image:FileImage(socialappcubit.get(context).postimage!),
                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                    IconButton(
                      onPressed: (){
                        socialappcubit.get(context).removeimage();
                      },
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
                      child: TextButton(
                        onPressed: (){},


                        child: Text('tags  #',style: TextStyle(fontSize: 20),),

                      ),
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