import 'package:appoo/layout/social_app_layout/cubit/cubit.dart';
import 'package:appoo/layout/social_app_layout/cubit/states.dart';
import 'package:appoo/modules/social_app/social_edit_screen/social_edit_screen.dart';
import 'package:appoo/shared/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class social_settings_screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return

      BlocConsumer<socialappcubit,socialappstates>(
        listener: (context,state){},
        builder: (context,state){
          var model=socialappcubit.get(context).usermodel;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 240,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment:AlignmentDirectional.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${model!.cover}'
                                ),
                                fit: BoxFit.cover,
                              )
                          ),

                        ),
                      ),
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child:CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            '${model.image}'
                          ),

                        ) ,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${model.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '${model.bio}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                        InkWell(
                          child: Column(
                            children: [
                              Text(
                                'posts',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                      Expanded(
                        child:
                        InkWell(
                          child: Column(
                            children: [
                              Text(
                                'photos',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '150',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                      Expanded(
                        child:
                        InkWell(
                          child: Column(
                            children: [
                              Text(
                                'followers',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '100k',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                      Expanded(
                        child:
                        InkWell(
                          child: Column(
                            children: [
                              Text(
                                'following',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '150k',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                  Expanded(
                      child: OutlinedButton(
                        onPressed: () {  },
                        child: Text('Add Photo'),
                      )
                  ),
                    SizedBox(
                      width: 5,
                    ),

                    OutlinedButton(
                      onPressed: () {
                        navto(context, social_edit_screen());
                      },
                      child: Icon(Icons.edit,size: 16,),

                    ),
                  ],
                ),
              ],
            ),
          );
        },

      );

  }

}