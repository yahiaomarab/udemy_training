import 'package:appoo/layout/social-app/cubit/cubit.dart';
import 'package:appoo/layout/social-app/cubit/states.dart';
import 'package:appoo/models/social_comment_model.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class social_comments_screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:BlocConsumer<socialappcubit,socialappstates>(
        listener: (context,state){},
        builder:(context,state){
          return ConditionalBuilder(
            condition:socialappcubit.get(context).comments.length>0 ,
            builder: (context)=>ListView.separated(
                itemBuilder: (context,index)=>buidlcommentitem(context,socialappcubit.get(context).comments[index]),
                separatorBuilder:(context,index)=> SizedBox(height: 5,),
                itemCount: socialappcubit.get(context).comments.length,
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          );
        },

      ) ,
    );
  }
Widget buidlcommentitem(context,socialaddcommentmodel model)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('${model.image}'),
          radius: 20,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${model.name}',style: Theme.of(context).textTheme.bodyText1,),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.check_circle,size: 13,color: Colors.blue,),

                ],
              ),
              Row(
                children: [
                  Text(
                    '${model.text}',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      height: 1.3,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${model.dataTime}',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(

                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
      ],
    ),
  );
}
}