import 'package:appoo/layout/api_app/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/component/component.dart';

class science extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var list=newappcubit.get(context).sccience;
    return buildarticleit (list,context);
  }

}