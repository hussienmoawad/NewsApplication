import 'package:flutter/material.dart';
import 'package:newsapplication/Home/my_theme.dart';
import 'package:newsapplication/News/NewsItem.dart';
import 'package:newsapplication/News/newsContinerViewModel.dart';
import 'package:newsapplication/model/SourcesRespones.dart';
import 'package:provider/provider.dart';

class NewsContinar extends StatefulWidget{
Source source;

NewsContinar({required this.source});

  @override
  State<NewsContinar> createState() => _NewsContinarState();
}

class _NewsContinarState extends State<NewsContinar> {

  newsContinerModelView viewModwl=newsContinerModelView();
  @override
  void initState() {

    viewModwl.getNewsById(widget.source.id??"");

  }



  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>viewModwl,
      child: Consumer<newsContinerModelView>(builder: (context,viewModel,child){
        if(viewModel.erorrMessage !=null){
          return Column(
            children: [
              Text(viewModel.erorrMessage!),
              ElevatedButton(onPressed: (){
                viewModel.getNewsById(widget.source.id??'');
              }, child: Text('try again'))
            ],
          );
        }
        else if (viewModel.listNews == null) {
          return Center(
              child: CircularProgressIndicator(
                color: MyTheme.prim,
              ));
        } else {
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news:viewModwl.listNews![index]);
          },
            itemCount: viewModwl.listNews?.length,
          );
        }
      }
      ),
    );

      /*FutureBuilder<NewsResponse>(

        future: ApiManger.getNewsBysourceid(widget.source.id??''),
        builder: (context,snapshot){
          if (snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: MyTheme.prim,
            ));
          }else if(snapshot.hasError){
            return Column(
              children: [
              Text('somthing went wrong'),
              ElevatedButton(onPressed: () {

                ApiManger.getNewsBysourceid(widget.source.id??'');
                setState(() {

                });
              }, child: Text('try again')),
            ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Text(snapshot.data?.message??'somthing went wrong');
          }
          var NewsList =snapshot.data?.articles ??[];
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: NewsList[index]);
          },
          itemCount: NewsList.length,
          );
        }
        );*/
  }
}
