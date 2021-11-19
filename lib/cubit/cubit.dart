import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/main.dart';
import 'package:flutter_news_app/modules/bussines.dart';
import 'package:flutter_news_app/modules/science.dart';
import 'package:flutter_news_app/modules/sports.dart';
import 'package:flutter_news_app/netWork/dio_helper.dart';
import 'package:flutter_news_app/netWork/local/cache_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0 ;
  List<BottomNavigationBarItem> bottomItems =[
   const BottomNavigationBarItem(
        icon: Icon(
            Icons.business),
      label: 'Business',
    ),
   const BottomNavigationBarItem(
      icon: Icon(
          Icons.sports),
      label: 'Sports',
    ),
   const BottomNavigationBarItem(
      icon: Icon(
          Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> screens=[
    BussinesScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index  ==1)getSports();
    else if(index  ==2)getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic>business=[];
  void getBusinees(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
      'country':'eg',
      'category':'business',
      'apiKey':'$apiKey'
    },
    ).then((value){
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetBusinessErrorState(e.toString()));
    });
  }

  List<dynamic>sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'$apiKey'
    },).then((value){
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetSportsErrorState(e.toString()));
    });
  }

  List<dynamic>science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'science',
      'apiKey':'$apiKey'
    },).then((value){
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetScienceErrorState(e.toString()));
    });
  }


  List<dynamic>search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
      'q':'$value',
      'apiKey':'$apiKey'
    },).then((value){
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetSearchErrorState(e.toString()));
    });
  }

}



class NewsModeCubit extends Cubit<NewsModeStates> {
  NewsModeCubit() : super(NewsModeInitialState());

  static NewsModeCubit get(context) => BlocProvider.of(context);

  //ThemeMode appMode = ThemeMode.dark;
  bool isDark = false;
  void changeAppMode()
  {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value){
    emit(NewsModeChangeState());
    });

  }

}