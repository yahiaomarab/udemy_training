import 'package:appoo/layout/api_app/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../shared/component/component.dart';

class science extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var list=newappcubit.get(context).sccience;
    return buildarticleit (list,context);
  }

}