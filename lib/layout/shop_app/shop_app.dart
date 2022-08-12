import 'package:appoo/layout/shop_app/cubit/cubit.dart';
import 'package:appoo/layout/shop_app/cubit/states.dart';
import 'package:appoo/modules/shopapp/searchscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component.dart';

class shopapp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
  
    return
      BlocConsumer<shopcubit,shopappstate>(

        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          appBar: AppBar(
            title: Text(
              'SHOPPING AMAZON',
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  navto(context, searchscreen());
                },
                icon: Icon(Icons.search,),
              ),
            ],
          ),
          body: shopcubit.get(context).screenss[shopcubit.get(context).currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: shopcubit.get(context).currentindex,
            onTap: (index)
            {
              shopcubit.get(context).changebottomindex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories',
              ),
          //    BottomNavigationBarItem(
          //      icon: Icon(Icons.favorite),
          //      label: 'favorite',
          //    ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        ),

      );
  }

}