 import 'package:appoo/models/favoritesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/shop_app/cubit/cubit.dart';
import '../../layout/shop_app/cubit/states.dart';
import '../../shared/component/component.dart';
import '../../shared/styles/colors.dart';

class productscreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopcubit,shopappstate>(
      listener: (context,state){},
      builder:(context,state)=>Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildfavitem(shopcubit.get(context).favormodel!.data.data[index],context),
          separatorBuilder:(context,index)=>dividorline(),
          itemCount: shopcubit.get(context).favormodel!.data.data.length,
        ),
      ),
    );
  }
Widget buildfavitem(favoritesdata model,context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack (
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: AssetImage(
                  '${model.product.image}',
                ),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              if(model.product.discount !=0)
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.product.name} ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.product.price.toString()}',
                      style: TextStyle(
                        fontSize: 15,
                        color: dafultcolor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if(model.product.discount!=0)
                      Text(
                        '${model.product.oldprice.toString()}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      icon: CircleAvatar(
                          backgroundColor:shopcubit.get(context).favorites[model.product.id]! ?  dafultcolor:Colors.grey,
                          radius: 15,
                          child: Icon(Icons.favorite_border,size: 15,color: Colors.white,)),
                      onPressed: () {
                        shopcubit.get(context).changefavorites(model.product.id);

                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}
}
//shopcubit.get(context).favorites[model.product.id]! ?  dafultcolor:Colors.grey


