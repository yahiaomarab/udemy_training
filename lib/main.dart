import 'package:appoo/layout/shop_app/cubit/cubit.dart';
import 'package:appoo/shared/component/component.dart';
import 'package:appoo/shared/constants/constants.dart';
import 'package:appoo/shared/network/local/cache-helper.dart';
import 'package:appoo/shared/network/remote/dio-helper.dart';
import 'package:appoo/shared/styles/styles.dart';
import 'package:appoo/shared/cubit/cubit.dart';
import 'package:appoo/shared/cubit/states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/api_app/cubit/cubit.dart';
import 'layout/social-app/cubit/cubit.dart';
import 'layout/social-app/social_app_layout.dart';
import 'modules/social-app/social_login_app/social_login_app.dart';

//messaging notifications
Future<void>backgroundingmessagehandling(RemoteMessage message)async
{
  print('backgroundingmessagehandling');
  toastmassage(massege: 'backgroundingmessagehandling', state: ToastState.Sucess);
  print(message.data.toString());
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token=await FirebaseMessaging.instance.getToken();
  print(token);
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    toastmassage(massege: 'onMessageOpenedApp', state: ToastState.Sucess);
    print(event.data.toString());
  });
  FirebaseMessaging.onMessage.listen((event) {
    toastmassage(massege: 'onMessage', state: ToastState.Sucess);
    print(event.data.toString());
  });
  FirebaseMessaging.onBackgroundMessage(backgroundingmessagehandling);
  DioHelper.init();
 await  cachehelper.init();
  bool isDark=cachehelper.Gettdata(key: "isdark");
 //bool boarding=cachehelper.Gettdata(key: "boarding");
// bool? token= cachehelper.Gettdata(key: 'token');
  uId=cachehelper.Gettdata(key: 'uId');
  Widget startwidget;
  if(uId!=null)
    {
      startwidget=socialapp();
    }else
      {
        startwidget=sociallogin();
      }
//if(boarding !=null)
//   {
//     if(token != null)
//
//        startwidget=  shopapp();
//       else
//
//           startwidget=sociallogin();
//
//
//   }else
//     {
//       startwidget=onboardingscreen();
//     }

  runApp( MyApp(
     isDark,startwidget,
  ));
}
class MyApp extends StatelessWidget {
   final bool isDark;
   final Widget startwidget;

  MyApp(this.isDark,
      this.startwidget,);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          newappcubit()
            ..getbusinessdata()
            ..getsciencedata()
            ..getsportsdata(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
          appcubit()
            ..changemode(
              formshare: isDark,
            ),
        ),
        BlocProvider(
            create: (BuildContext context) =>
            shopcubit()
              ..homedatamodeluser()
              ..categoriesdatamodeluser()
              ..profiledatamodeluser()
        ),
        BlocProvider(
            create: (BuildContext context) =>
            socialappcubit()
              ..getUserData()
                ..getposts()

                //..getcomments()
        ),
      ],
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            themeMode:appcubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darktheme,
            home: startwidget,
          );
        },
      ),

    );
  }

}
