import 'package:appoo/models/social_addingpostmodel.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/social_app_layout/cubit/cubit.dart';
import '../../../layout/social_app_layout/cubit/states.dart';

class social_feeds_screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialappcubit,socialappstates>(
      listener: (context,state){},
      builder:(context,state){
        return ConditionalBuilder(
          condition: socialappcubit.get(context).posts.length>0 && socialappcubit.get(context).usermodel!=null  ,
          builder: (contxt)=>Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Card(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children:[
                            Image(
                              image:NetworkImage(
                                  'https://envato-shoebox-0.imgix.net/2555/b050-caa4-4e7d-970c-e6144a76d023/envato19252.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=800&s=0af3f5c0d2b1420da7431fb3bce38aaf'
                              ) ,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'communicate with friends',
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5,
                      ),
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap:true ,
                      itemBuilder: (context,index)=>buildcarditem(context,socialappcubit.get(context).posts[index],index),
                      separatorBuilder: (context,index)=>SizedBox(
                        height: 10,
                      ),
                      itemCount: socialappcubit.get(context).posts.length,
                    ),
                  ],
                ),
              )
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),

        ) ;
      },

    );
  }
 Widget buildcarditem (context,socialaddpostmodel model,index)=> Card(
   clipBehavior: Clip.antiAliasWithSaveLayer,
   elevation: 5,
   margin: EdgeInsets.symmetric(
     horizontal: 10,
   ),
   child:Padding(
     padding: const EdgeInsets.all(10.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(
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
                   Text(
                     '${model.dataTime}',
                     style: Theme.of(context).textTheme.caption?.copyWith(
                         height: 1.3
                     ),
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
         Padding(
           padding: const EdgeInsets.symmetric(
             vertical: 15,
           ),
           child: Container(
             width: double.infinity,
             height: 1,
             color: Colors.grey[300],
           ),
         ),
         Text(
         '${model.text}',
           style: Theme.of(context).textTheme.subtitle1,
         ),
         SizedBox(
          height: 15,
        ),
          Padding(
                           padding: const EdgeInsetsDirectional.only(
                             bottom: 5,
                             top: 10,
                           ),
                           child: Container(
                             width: double.infinity,
                             child: Wrap(
                               children: [
                                 Padding(
                                   padding: const EdgeInsetsDirectional.only(
                                     end: 6,
                                   ),
                                   child: Container(
                                     height: 20,
                                     child: MaterialButton(
                                       onPressed: (){},
                                       minWidth: 1,
                                       padding: EdgeInsets.zero,
                                       child: Text(
                                         '#software',
                                         style: TextStyle(
                                           color: Colors.blue,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsetsDirectional.only(
                                     end: 6,
                                   ),
                                   child: Container(
                                     height: 20,
                                     child: MaterialButton(
                                       onPressed: (){},
                                       minWidth: 1,
                                       padding: EdgeInsets.zero,
                                       child: Text(
                                         '#flutter',
                                         style: TextStyle(
                                           color: Colors.blue,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
         if(model.postimage!= '')
            Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage('${model.postimage}'),
                          fit: BoxFit.cover,
                        )
                    ),

                  ),
         Padding(
           padding: const EdgeInsets.only(
             top: 10,
             bottom: 5,
           ),
           child: Row(
             children: [
               Expanded(
                 child:
                 InkWell(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(
                       vertical: 5,
                     ),
                     child: Row(
                       children: [
                         Icon(Icons.favorite_border,color: Colors.grey,size: 18,),
                         SizedBox(
                           width: 5,
                         ),
                         Text('${socialappcubit.get(context).postlikes[index]}',
                           style: TextStyle(
                             color: Colors.grey,
                           ),),
                       ],
                     ),
                   ),
                   onTap: (){},
                 ),
               ),
               Expanded(
                 child:
                 InkWell(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Icon(Icons.mode_comment_outlined,color: Colors.grey,size: 14,),
                       SizedBox(
                         width: 5,
                       ),
                       Text('0 comments',
                         style: TextStyle(
                           color: Colors.grey,
                         ),),
                     ],
                   ),
                   onTap: (){},
                 ),
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(
             bottom: 10,
           ),
           child: Container(
             width: double.infinity,
             height: 1,
             color: Colors.grey[300],
           ),
         ),
         Row(
           children: [
             Expanded(
               child: InkWell(
                 child: Row(
                   children: [
                     CircleAvatar(
                       backgroundImage: NetworkImage('${socialappcubit.get(context).usermodel!.image}'),
                       radius: 10,
                     ),
                     SizedBox(
                       width: 15,
                     ),
                     Text(
                       'write a comment.......',
                       style: Theme.of(context).textTheme.caption,
                     )
                   ],
                 ),
                 onTap: (){},
               ),

             ),
             Padding(
               padding: const EdgeInsets.only(
                 right: 40,
                 left:10,
               ),
               child:
               InkWell(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Icon(Icons.favorite_border,color: Colors.grey,size: 14,),
                     SizedBox(
                       width: 5,
                     ),
                     Text('likes',
                       style: TextStyle(
                         color: Colors.grey,
                       ),),
                   ],
                 ),
                 onTap: (){
                   socialappcubit.get(context).getpostslikes(socialappcubit.get(context).postid[index]);
                 },
               ),

             ),
             Padding(
               padding: const EdgeInsets.symmetric(
                   horizontal: 10
               ),
               child:
               InkWell(
                 child: Padding(
                   padding: const EdgeInsets.only(
                     right: 30,
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Icon(Icons.ios_share_outlined,color: Colors.grey,size: 14,),
                       SizedBox(
                         width: 5,
                       ),
                       Text('share',
                         style: TextStyle(
                           color: Colors.grey,
                         ),),
                     ],
                   ),
                 ),
                 onTap: (){},
               ),

             ),
           ],
         ),
       ],
     ),
   ) ,
 );
}