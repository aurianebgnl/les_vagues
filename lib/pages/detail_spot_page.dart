import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';

class DetailSpotPage extends StatefulWidget {
  const DetailSpotPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DetailSpotPage> createState() => _DetailSpotPageState();
}

class _DetailSpotPageState extends State<DetailSpotPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: MyTopNav(),
      body: Container(
        child: Column(
          children:[
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Ville, Pays'),
                    Text('Nom du spot'),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('Note (nb votes)'),
                    Text('Date ajout spot'),
                  ],
                ),
              ],),

              const SizedBox(height: 16),
              
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Difficulté : '),
                    Text('Type de vague :'),
                    Text('Saison'),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('*****'),
                    Text('Reef Break'),
                    Text('Juin'),
                  ],
                ),
              ],),
              
              const SizedBox(height: 16),

              Text('Géolocalisation'),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
                fit: BoxFit.cover,
              ),

            ]),
        
      ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        ),
    );
  }
}
