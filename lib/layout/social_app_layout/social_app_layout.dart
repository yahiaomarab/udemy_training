import 'package:appoo/layout/social_app_layout/cubit/cubit.dart';
import 'package:appoo/layout/social_app_layout/cubit/states.dart';
import 'package:appoo/modules/social_app/social_addpost_screen/social_addpost_screen.dart';
import 'package:appoo/shared/component/component.dart';
import 'package:appoo/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class socialapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialappcubit,socialappstates>(
      listener: (context,state){
        if (state is socialaddpoststate)
          navto(context, social_addpost_screen());
      },
      builder: (context,state)=>
          Scaffold(
        appBar: AppBar(
          title:Text(
              socialappcubit.get(context).titles[socialappcubit.get(context).currentindex],

          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(IconBroken.Notification),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(IconBroken.Search),
            ),
          ],
        ),
         body: socialappcubit.get(context).screens[socialappcubit.get(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: socialappcubit.get(context).currentindex,
              onTap: (int index){
                socialappcubit.get(context).changebottomnavigatioonitem(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon:Icon(
                       IconBroken.Home,
                    ),
                  label:'home' ,
                ),
                BottomNavigationBarItem(
                  icon:Icon( IconBroken.Chat),
                  label:'cahts' ,
                ),
                BottomNavigationBarItem(
                  icon:Icon( Icons.upload_outlined),
                  label:'Post' ,
                ),
                BottomNavigationBarItem(
                  icon:Icon( IconBroken.User),
                  label:'users' ,
                ),
                BottomNavigationBarItem(
                  icon:Icon( IconBroken.Setting),
                  label:'settings' ,
                ),
              ],
            ),
      ),
    );
  }

}
