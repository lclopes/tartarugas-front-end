import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tartarugas/pages/image_data.dart';
import 'package:tartarugas/pages/nft_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tartarugas',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Tartarugas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/tt-3.png", height:60),
        actions: [
          IconButton(icon: Image.asset("assets/tt-1.png", height: 70),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NFTPage()),
              );}
          )
        ]
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/tt-2.png",
              height: 250,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  LocationPermission permission = await Geolocator.checkPermission();
                  await getLocation(permission);
                  final ImagePicker _picker = ImagePicker();
                  final img =
                  await _picker.pickImage(source: ImageSource.gallery, maxHeight: 400, maxWidth: 400);
                  if(permission != LocationPermission.denied || permission != LocationPermission.deniedForever){
                    setState(() {
                      image = img;
                      goToImagePage(context);
                    });
                  }
                },
                label: const Text('Selecionar imagem',style: TextStyle(color: Colors.white, fontSize: 24)),
                icon: const Icon(Icons.image, color: Colors.white,)
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  LocationPermission permission = await Geolocator.checkPermission();
                  await getLocation(permission);
                  final ImagePicker _picker = ImagePicker();
                  final img =
                  await _picker.pickImage(source: ImageSource.camera);
                  if(permission != LocationPermission.denied || permission != LocationPermission.deniedForever){
                    setState(() {
                      image = img;
                      goToImagePage(context);
                    });
                  }
                },
                label: const Text('Tirar uma foto',style: TextStyle(color: Colors.white, fontSize: 24)),
                icon: const Icon(Icons.camera_alt_outlined, color: Colors.white,),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void goToImagePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDataPage(image: image),
      ),
    );
  }

  Future getLocation(LocationPermission permission) async {
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }else if(permission == LocationPermission.deniedForever){
        print("'Location permissions are permanently denied");
      }else{
        print("GPS Location service is granted");
      }
    }else{
      print("GPS Location permission granted.");
    }
  }
}
