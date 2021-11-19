import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/layout/news_layout.dart';
import 'package:flutter_news_app/netWork/dio_helper.dart';
import 'package:flutter_news_app/netWork/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';



const String apiKey='ee6b460554894f91b8ec4b2c7383178f';
const String  search='https://newsapi.org/v2/everything?q=bitcoin&apiKey=';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NewsCubit()..getBusinees()),
        BlocProvider(create: (context)=>NewsModeCubit()..changeAppMode()),
      ],
      child: BlocConsumer<NewsModeCubit, NewsModeStates>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: NewsModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
              iconTheme:const IconThemeData(
          color: Colors.white,
              ),
              textTheme:const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )
              ),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme:const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:const AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: Colors.white,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                //backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                selectedItemColor:Colors.deepOrange,
                elevation: 20.0,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme:const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )
              ),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme:const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle:const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: HexColor('333739'),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme:const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                selectedItemColor:Colors.deepOrange,
                elevation: 20.0,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
