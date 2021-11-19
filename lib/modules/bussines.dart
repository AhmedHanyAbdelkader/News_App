import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/modules/web_view/web_view_screen.dart';


class BussinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context , state){

        var list =NewsCubit.get(context).business;


        return state is! NewsGetBusinessLoadingState
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


Widget buildArticleItem(article,context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewScreen(article['url'])));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover
                )
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  Text('${article['publishedAt']}',
                    style:const TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget myDevider(){
  return SizedBox(
    height: 1,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Colors.grey,
      ),
    ),
  );
}