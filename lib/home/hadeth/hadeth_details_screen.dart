import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/quran/item_sura_details_screen.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String nameRoute = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List <String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs ;
    if(verses.isEmpty){
      loadfile(args.index);
    }
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            '${args.name}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty ?
            Center(child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ))
            :
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.06
          ),
          decoration: BoxDecoration(
            color: AppColors.whitColor,
            borderRadius: BorderRadius.circular(24)
          ),
          child: ListView.separated(
            separatorBuilder: (context,index){
              return Divider(
                color: AppColors.primaryLightColor,
                thickness: 2,
              );
            },
              itemBuilder: (context,index){
                return ItemSuraDetailsScreen(
                    content: verses[index],
                index: index,);
              },
            itemCount: verses.length,
          ),
        ),
      )
    ]);
  }

  void loadfile(int index) async{
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List <String> lines = content.split('\n');
    for (int i=0; i<lines.length; i++){
      print(lines[i]);
    }
    verses = lines;
    setState(() {

    });
  }
}
//data type
class SuraDetailsArgs{
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}