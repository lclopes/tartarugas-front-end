import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:tartarugas/pages/new_upload_page.dart';

class ImageDataPage extends StatelessWidget {
  const ImageDataPage({super.key, required this.image});
  final XFile? image;


  @override
  Widget build(BuildContext context) {
    String location;
    if(image != null) {
      return FutureBuilder(
          future: getLatLong(),
          initialData: "Carregando localização...",
          builder: (BuildContext context, AsyncSnapshot<String> latlong) {
            if(latlong.hasData) {
              location = latlong.data!;
              return Scaffold(
                  appBar: AppBar(
                      leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back), color: Colors.white,),
                      centerTitle: true,
                      title: Image.asset("assets/imagem.png", height:50)
                  ),
                  body: Center(
                    child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.file(
                            scale: 1.2,
                            File(image!.path)
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Localização: ", style: TextStyle(fontSize: 18)),Text(location, style: TextStyle(fontSize: 18))],
                        ),
                        Container(
                            width: 130,
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewUploadPage(image: image, latlong: location,),
                              ),
                            );}, child: Row(children: [Icon(Icons.upload_rounded, color: Colors.white), Text("Upload", style: TextStyle(color: Colors.white))],)))

                      ]
                  ))
              );
            } else {
              return Text("Sem localização");
            }
          }
      );
    } else {
      return SizedBox();
    }
  }

  Future<String> getLatLong() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String long = position.longitude.toString();
    String lat = position.latitude.toString();

    return "$lat,$long";
  }
}
