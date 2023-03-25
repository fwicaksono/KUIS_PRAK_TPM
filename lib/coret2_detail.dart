import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_123200160/disease_data.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:auto_size_text/auto_size_text.dart';


//Coret-Coret Detail

class HalamanDetailDisease extends StatefulWidget {
  final Diseases dis;
  const HalamanDetailDisease({Key? key, required this.dis}) : super(key: key);

  @override
  State<HalamanDetailDisease> createState() => _HalamanDetailBukuState();
}

class _HalamanDetailBukuState extends State<HalamanDetailDisease> {
  final Uri _url = Uri.parse('https://flutter.dev');
  bool isAvailable = true;
  //
  var warna = Colors.green;
  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.dis.name}"),
          centerTitle: true,
          actions: [
            FavoriteButton(
              valueChanged: (_isFavorite) {
              },

            )
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 210,
                width: 300,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(widget.dis.imgUrls),
                  ],
                ),
              ),
              Card(
                child: Container(
                  height: 250,
                  width: 800,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Disease Name                : " + widget.dis.name,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            "Plant Name                   : " + widget.dis.plantName,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Flexible(child: AutoSizeText(
                            "Symptom                      : " +
                                widget.dis.symptom,
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            maxLines: 4, overflow: TextOverflow.ellipsis
                          ),)
                          /*AutoSizeText(
                            "Symptom                      : " +
                                widget.dis.symptom,
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            maxLines: 4,
                          ),*/,
                          SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            "kesimpulan : " + widget.dis.nutshell.toString(),
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 500,
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(20),
                  ),
                  onPressed: () async {
                    await goToWebPage(widget.dis.imgUrls);
                  },
                  child: const Text('Link to image'),
                ),
              ),
            ],
          ),
        ));
  }
}