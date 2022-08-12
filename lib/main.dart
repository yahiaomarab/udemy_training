import 'package:appoo/layout/shop_app/cubit/cubit.dart';
import 'package:appoo/layout/social_app_layout/cubit/cubit.dart';
import 'package:appoo/shared/bloc_observer.dart';
import 'package:appoo/shared/constants/constants.dart';
import 'package:appoo/shared/cubit/cubit.dart';
import 'package:appoo/shared/cubit/states.dart';
import 'package:appoo/shared/network/local/cacah_helper.dart';
import 'package:appoo/shared/network/remote/dio_helper.dart';
import 'package:appoo/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/api_app/cubit/cubit.dart';
import 'layout/social_app_layout/social_app_layout.dart';
import 'modules/social_app/social_login_app/social_login_app.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp( MyApp(
     isDark,startwidget,
  ));
}
class MyApp extends StatelessWidget {
  late final bool isDark;
  late final Widget startwidget;

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