import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/api_app/cubit/cubit.dart';
import '../../layout/api_app/cubit/states.dart';
import '../../shared/component/component.dart';


class search extends StatelessWidget
{
  var searchcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list=newappcubit.get(context).search;
    return BlocConsumer<newappcubit,newappstates>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              formfield(
                  controller: searchcontroller,
                  prefix: Icons.search,
                  type: TextInputType.text,
                  text: 'search',
                  onchange: (value)
                  {
                    newappcubit.get(context).getsearchsdata(value);
                  },
                  validate: (String? value)
                  {

                  if ( value!.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    else
                    {
                      return null;
                    }
                  }
              ),
              Expanded(
                  child:
                  buildarticleit(list, context,isSearch: true)
              ),
            ],
          ),
        ),
      ),
    );
  }

}