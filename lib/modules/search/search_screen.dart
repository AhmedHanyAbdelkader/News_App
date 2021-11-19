import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/modules/bussines.dart';


class SearchScreen extends StatelessWidget {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hoverColor: Colors.deepOrange,
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Search',
                    prefixIcon:const Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child:state is! NewsGetSearchLoadingState ? ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    separatorBuilder: (context, index){
                      return myDevider();
                    },
                    itemBuilder: (context , index){
                      return buildArticleItem(list[index],context);
                    }):const Center(child: CircularProgressIndicator(),),
              ),
            ],
          ),
        );
      },
    );
  }
}
