import 'package:appoo/layout/api_app/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/apiapp/business.dart';
import '../../../modules/apiapp/science.dart';
import '../../../modules/apiapp/sports.dart';
import '../../../shared/network/remote/dio_helper.dart';

class newappcubit extends Cubit<newappstates>{
  newappcubit():super(intialstate());
  static newappcubit get(context)=>BlocProvider.of(context);
  int currentindex=0;
  List<BottomNavigationBarItem>bottomitem=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label:'Business' ,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label:'Sports',
    ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.settings),
    //label:'settings',
    //  ),
  ];
  List<Widget>screens=[
    bussiness(),
    science(),
    sports(),
    // settings(),
  ];
  List<String>titles=[
    'Bussiness News ',
    'Science News',
    'Sports News',
    'Settings',
  ];
  List<dynamic>business=[];
  List<dynamic>sccience=[];
  List<dynamic>spports=[];
  void getbusinessdata()
  {
    emit(businessloadingstate());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

    ).then((value) {
      business=value.data['articles'];
      print(value.data['articles'][0]['title']);
      emit(newgetbusinesssucessdata());
    }).catchError((erorr){
      print(erorr.toString());
      emit(newgetbusinesserorrdata(
          erorr.toString()
      ));
    });
  }

  void getsciencedata()
  {

    emit(scienceloadingstate());


    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

    ).then((value) {
      sccience=value.data['articles'];
      print(value.data['articles'][0]['title']);
      emit(newgetsciencesucessdata());
    }).catchError((erorr){
      print(erorr.toString());
      emit(newgetscienceerorrdata(
          erorr.toString()
      ));
    });

  }

  void getsportsdata()
  {
    emit(sportsloadingstate());
    if(spports.length==0)

      DioHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
        },

      ).then((value) {
        spports=value.data['articles'];
        print(value.data['articles'][0]['title']);
        emit(newgetsportssucessdata());
      }).catchError((erorr){
        print(erorr.toString());
        emit(newgetsportserorrdata(
            erorr.toString()
        ));
      });


  }
  void changeindexnav( int index){
    currentindex=index;
    if(index==1)
      getsciencedata();
    else if(index==2)
      getsportsdata();
    emit(newindexstate());
  }
  List<dynamic>search=[];
  void getsearchsdata(String? value)
  {
    emit(businessloadingstate());
    search=[];

    DioHelper.getdata(
      url: 'v2/everything',
      query: {

        'q':"$value",
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

    ).then((value) {
      search=value.data['articles'];
      // print(value.data['articles'][0]['title']);
      emit(newgetsearchsucessdata());
    }).catchError((erorr){
      print(erorr.toString());
      emit(newgetsearcherorrdata(
          erorr.toString()
      ));
    });
  }

}