import 'package:flutter/material.dart';

class NFTPage extends StatelessWidget {
  const NFTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back), color: Colors.white,),
          centerTitle: true,
          title: Image.asset("assets/central-nfts.png", height:50),
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
            color: Colors.teal[100],
            child: Column(
              children: [
                Image.asset("assets/exemplo1.jpeg"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Leonardo", style: TextStyle(fontSize: 20),),
                    ElevatedButton(onPressed: (){}, child: Row(children: [Icon(Icons.monetization_on_rounded), Text("100,00")],))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              children: [
                Image.asset("assets/exemplo2.jpeg"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Michelangelo", style: TextStyle(fontSize: 20),),
                    ElevatedButton(onPressed: (){}, child: Row(children: [Icon(Icons.monetization_on_rounded), Text("200,00")],))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              children: [
                Image.asset("assets/exemplo3.jpeg"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Donatello", style: TextStyle(fontSize: 20),),
                    ElevatedButton(onPressed: (){}, child: Row(children: [Icon(Icons.monetization_on_rounded), Text("300,00")],))
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
