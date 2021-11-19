import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';

import 'bussines.dart';


class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context , state){
        var list =NewsCubit.get(context).science;
        return list.length>0
            ? ListView.separated(
            physics:const BouncingScrollPhysics(),
            itemCount: list.length,
            separatorBuilder: (context, index){
              return myDevider();
            },
            itemBuilder: (context , index){
              return buildArticleItem(list[index],context);
            })
            :const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}