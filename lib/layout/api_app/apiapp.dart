import 'package:appoo/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/apiapp/search.dart';
import '../../shared/component/component.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class apiapp extends StatelessWidget
    {
  @override
  Widget build(BuildContext context)
      {
    return
      BlocConsumer<newappcubit,newappstates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                newappcubit.get(context).titles[newappcubit.get(context).currentindex],
              ),
              actions: [
                IconButton(
                  onPressed: (){
                   navto(context, search());
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: ()
                  {
                    appcubit.get(context).changemode();
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: newappcubit.get(context).screens[newappcubit.get(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:newappcubit.get(context).currentindex ,
              onTap: (index){
                newappcubit.get(context).changeindexnav(index);
              },
              items: newappcubit.get(context).bottomitem,
            ),
          );
        },
      );
     }
    }