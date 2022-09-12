
import 'package:appoo/shared/cubit/cubit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../layout/api_app/cubit/cubit.dart';
import '../../layout/api_app/cubit/states.dart';

Widget formfield (
    {
      required TextEditingController controller ,
      required TextInputType type ,
      Function(String)? onSubmit ,
      VoidCallback? onTap ,
      Function(String)? onChanged ,
      required String? Function(String?)? validate ,
      required String label ,
      IconData? prefix ,
      IconData? suffix = null ,
      bool isPassword = false,
      bool isClickable = true ,
      VoidCallback? onSuffixPressed ,

    }) => TextFormField(
  validator: validate,
  obscureText: isPassword,
  controller: controller,
  decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix ,),
      suffixIcon: GestureDetector(
        child: Icon(suffix),
        onTap: onSuffixPressed,
      ),
      border: OutlineInputBorder()
  ),
  keyboardType: type,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  onTap: onTap,

) ;

Widget button(
    {
      required double x,
      required String text,
      required OnPressed,
      required double width,
    }
    )
{
  return Container(
    color: Colors.blueGrey[400],
    width: width,
    height: x,
    child: MaterialButton(


      onPressed: OnPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),

    ),
  )  ;
}
Widget itembuilder (Map model,context )=>Dismissible(
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:Container(
      child: Row(
        children: [
          CircleAvatar(
            child: Text('${model['time']}'),
            radius: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('${model['date']}'),
              ],
            ),
          ),

          SizedBox(
            width: 40,
          ),
          IconButton(
            icon:Icon(
              Icons.check_box,
              color:Colors.lightGreenAccent,
            ),
            onPressed: (){
              appcubit.get(context).updatedatabase(status: "done", id: model["id"],);
            },
          ),
          IconButton(
            icon:Icon(
              Icons.archive,
              color:Colors.grey,
            ),
            onPressed: (){
              appcubit.get(context).updatedatabase(status: "archived", id: model["id"]);
            },
          ),

        ],
      ),
    ),



  ),
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    appcubit.get(context).deletedatabase(id: model['id']);
  },
);
Widget buildarticleitem(article,context)
{

  return  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),

            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,

                child: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),

                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),
      );

}
Widget dividorline()
{
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20,
    ),
    child: Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey[300],
    ),
  );
}
Widget buildarticleit (list,context,{isSearch=false})
{
  return BlocConsumer<newappcubit,newappstates>(
    listener: (context,state){},
    builder: (context,state)=>ConditionalBuilder(
      condition: list.length>0,
      builder: (context)=>ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildarticleitem(list[index],context),
          separatorBuilder: (context,index)=>dividorline(),
          itemCount: 10),
      fallback: (context)=>isSearch?Container():Center(child: CircularProgressIndicator()),
    ),

  );

}
void navto(context,Widget)
{
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>Widget),
  );

}
void navandreplace(context,Widget)
{
  Navigator.pushAndRemoveUntil(
    context,
      MaterialPageRoute(builder: (context)=>Widget),
      (Route<dynamic>route)=>false,
  );
}
Future <bool?> toastmassage({
  required String massege,
  required ToastState state,


})
{
   return Fluttertoast.showToast(
      msg:'$massege',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choosetoastcolor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{Erorr,Sucess,Warning}
Color choosetoastcolor(ToastState state)
{
  Color color;
switch(state)
{
  case ToastState.Sucess:
   color=  Colors.green;
  break;
  case ToastState.Erorr:
  color= Colors.red ;
break;
  case ToastState.Warning:
color=Colors.blue;
break;
}
return color;
}
PreferredSizeWidget buildappbar(
{
  required BuildContext context,
  String? title,
  List<Widget>?actions,
}
    )=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon:Icon(Icons.arrow_back_ios_new_outlined),
  ),
  title: Text(title!),
  actions: actions,
);