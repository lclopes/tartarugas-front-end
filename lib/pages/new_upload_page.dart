import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewUploadPage extends StatelessWidget {
  const NewUploadPage({super.key, required this.image, required this.latlong});
  final XFile? image;
  final String latlong;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(onPressed: (){ backToHomePage(context);}, icon: Icon(Icons.arrow_back), color: Colors.white,),
            centerTitle: true,
            title: Image.asset("assets/imagem.png", height:50)
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.file(
                      scale: 1.2,
                      File(image!.path)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                        Row(children: [Text("Nome: Leonardo", style: TextStyle(fontSize: 20))]),
                        Row(children: [Text("Espécie: Chelonia mydas", style: TextStyle(fontSize: 20))]),
                        Row(children: [Text("Localização: ${this.latlong}", style: TextStyle(fontSize: 20))])
                      ],)
                    ],
                  )

                ],
              ),
            ),
          ],
        )
    );
  }

  void backToHomePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
