import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';


class done extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<appcubit,appstates>(
      listener: (context,state){},
      builder: (context,state)=>ListView.separated(
        itemBuilder: (context,index)=>itembuilder(appcubit.get(context).donetasks[index],context),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        itemCount: appcubit.get(context).donetasks.length,
      ),
    );
  }

}