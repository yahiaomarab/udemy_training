import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchscreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('search screen',style: Theme.of(context).textTheme.bodyText1,),),
    );
  }

}