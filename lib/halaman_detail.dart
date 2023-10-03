import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class Halamandetail extends StatelessWidget {
  final DataBuku lokasi;
  final Uri_url = Uri.parse('https://flutter.dev');
  Halamandetail({super.key, required this.lokasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(lokasi.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text(lokasi.title, style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height/3,
                  child : Image.network(lokasi.imageLink)),
              Column(
                children: [
                  Text('Author: ${lokasi.author}'),
                  SizedBox(height: 3),
                  Text('Country: ${lokasi.country}'),
                  SizedBox(height: 3),
                  Text('Language: ${lokasi.language}'),
                  SizedBox(height: 3),
                  Text('Pages: ${lokasi.pages}'),
                  SizedBox(height: 3),
                  Text('Year : ${lokasi.year}'),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(lokasi.link);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}