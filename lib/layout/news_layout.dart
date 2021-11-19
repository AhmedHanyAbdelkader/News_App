import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/modules/search/search_screen.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context , state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text('News App',
           // style: Theme.of(context).textTheme.bodyText1,
           ),
            //centerTitle: true,
            actions: [
              IconButton(icon:const Icon(Icons.search),
                  onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                  },
              ),
              IconButton(icon:const Icon(Icons.brightness_4_outlined),
                onPressed: (){
                NewsModeCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
          ),

        );
      },
    );
  }
}
