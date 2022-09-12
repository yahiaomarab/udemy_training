



import 'package:appoo/layout/shop_app/cubit/cubit.dart';
import 'package:appoo/layout/shop_app/cubit/states.dart';
import 'package:appoo/models/categoriesmodel.dart';
import 'package:appoo/models/homemodel.dart';
import 'package:appoo/shared/component/component.dart';
import 'package:appoo/shared/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homescreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<shopcubit,shopappstate>(
        listener: (context,state){
         if(state is favoritessucessstate)
            {
             if(!state.changefavmodel.status!)
                {
                  toastmassage(massege: state.changefavmodel.message!, state: ToastState.Erorr);
                }
            }
        },
        builder:(context,state)=>ConditionalBuilder
          (
            condition:shopcubit.get(context).homeee!=null&&shopcubit.get(context).catmodel!=null,
            builder: (context)=>productsbuilder(shopcubit.get(context).homeee!,context,shopcubit.get(context).catmodel!),
            fallback:(context)=> Center(child: CircularProgressIndicator(),),
        ),
      );
  }
Widget productsbuilder (homemodel model,context,categoriesmodel modil)
{
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items:model.data.banners?.map((e) =>
                Image(
              image:
            NetworkImage(
              '${e.image}',
            ),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            ).toList() ,
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              reverse: false,
              autoPlay: true,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(
                seconds: 3,
              ),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>buildcategories(modil.data!.data![index]),
                  separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  itemCount: modil.data!.data!.length,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'New Products',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1/1.43,
            children:
              List.generate(
                  model.data.products!.length,
                      (index) => buildgridproduct(model.data.products![index],context),
              ),

          ),
        ),
      ],
    ),
  );
}
Widget buildgridproduct (productsmodel model,context)
{
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                      image: NetworkImage(
                          '${model.image}',
                      ),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  if(model.discount!=0)
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                        '${model.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),

               Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: TextStyle(
                      fontSize: 15,
                      color: dafultcolor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if(model.discount!=0)
                  Text(
                    '${model.oldprice.round()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                        icon: CircleAvatar(
                          backgroundColor:shopcubit.get(context).favorites[model.id]! ?  dafultcolor:Colors.grey,
                            radius: 15,
                            child: Icon(Icons.favorite_border,size: 15,color: Colors.white,)),
                    onPressed: () {
                         shopcubit.get(context).changefavorites(model.id);
                          print(model.id);
                    },
                  ),
                ],
              ),
            ],
       ),
    ),
      ],
    ),
  );
}
Widget buildcategories(datamodel model,)
{
  return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: NetworkImage('${model.image}'),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.8),
              width: 100,
              child: Text(
                '${model.name}',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
}
}
//shopcubit.get(context).favorites[model.id]! ?  dafultcolor:

