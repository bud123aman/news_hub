import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../categories_screen.dart';


enum FilterList{bbcNews,bloomberg,businessinsider,cnn,aljazeera}
FilterList? selectedMenu ;

class HomeAppBarWidget extends StatelessWidget {
   HomeAppBarWidget({Key? key}) : super(key: key);

  String name = 'bbc-news' ;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
        },
        icon: Image.asset('images/category_icon.png' ,
          height: 30,
          width: 30,
        ),
      ),
      title: Text('News' , style: GoogleFonts.poppins(fontSize: 24 , fontWeight: FontWeight.w700),),
      actions: [
        PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon: Icon(Icons.more_vert , color: Colors.black,),
            onSelected: (FilterList item){

              if(FilterList.bbcNews.name==item.name){
                name='bbc-news';
              }
              if(FilterList.aljazeera.name==item.name){
                name='al-jazeera-english';
              }
              if(FilterList.bloomberg.name==item.name){
                name='bloomberg';
              }
              if(FilterList.cnn.name==item.name){
                name='cnn';
              }
              if(FilterList.businessinsider.name==item.name){
                name='business-insider';
              }
              context.read<NewsBloc>()..add(FetchNewsChannelHeadlines(name));


            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>> [


              const PopupMenuItem<FilterList>(
                value:FilterList.bbcNews,
                child:Text('BBC NEWS'),
              ),

              const PopupMenuItem<FilterList>(
                value:FilterList.aljazeera,
                child:Text('Al-jazeera NEWS'),
              ),
              const PopupMenuItem<FilterList>(
                value:FilterList.bloomberg,
                child:Text('BloomBerg(Business & Market related) NEWS'),
              ),
              const PopupMenuItem<FilterList>(
                value:FilterList.cnn,
                child:Text('Cnn NEWS'),
              ),
              const PopupMenuItem<FilterList>(
                value:FilterList.businessinsider,
                child:Text('Finance,Media & Tech NEWS'),
              ),


            ]
        )
      ],
    );
  }
}