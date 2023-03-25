import 'package:flutter/material.dart';
import 'package:kuis_123200160/disease_data.dart';
//import 'package:kuis_123200160/detail_data.dart';
import 'package:kuis_123200160/coret2_detail.dart';
import 'package:auto_size_text/auto_size_text.dart';


//Coret Coret List
//Card Data  //list
class HalamanListDisease extends StatelessWidget {
  const HalamanListDisease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plant Disease"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: const EdgeInsets.all(14),
        itemCount: listDisease.length,
        itemBuilder: (BuildContext context, int index) {
          final Diseases dis = listDisease[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => HalamanDetailDisease(dis:dis),));
            },
            child: Card(
              elevation: 10, //shadow
              child: Container(
                //ukuran card
                height: MediaQuery.of(context).size.height/4,
                width: 400,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        //ukuran foto
                          height: 300, width: 150,
                          child: Image.network(dis.imgUrls)
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    //bertingkat kasih column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        AutoSizeText(
                          dis.name,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 4,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          dis.plantName,
                          style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}