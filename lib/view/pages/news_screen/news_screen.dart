import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/model/news_model.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/components/core/news.dart';
import 'package:orange_workshop/view/pages/news_screen/news_description.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';

class NewsScreens extends  StatelessWidget {
  const NewsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppCubit cubit= AppCubit.get(context);
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ConditionalBuilder(
          condition: cubit.newsModel!=null,
          builder:(context)=> ConditionalBuilder(
            condition: cubit.newsModel!.data!.length >0,
            builder:(context)=> ListView.separated(
                itemBuilder: (context, index) =>newsCard(
                    model: cubit.newsModel!.data![index],
                    function: (){
                  navigateTo(context, NewsDescription(newsData: cubit.newsModel!.data![index],));
                }),
                separatorBuilder: (context, index)=> const SizedBox(height: 20.0,),
                itemCount: cubit.newsModel!.data!.length,
            ),
            fallback: (context)=>emptyScreen(text: 'No News Yet'),
          ),
          fallback: (context)=>const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
        )
      );
  }


}
