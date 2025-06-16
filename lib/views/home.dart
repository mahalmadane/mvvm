import 'package:flutter/material.dart';
import 'package:mvvm/modelviews/modelviewArticle.dart';
import 'package:mvvm/views/homePage.dart';
import 'package:mvvm/views/panier.dart';
import 'package:mvvm/views/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Modelviewarticle()),
      ],
      child: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> page = [MyHomePage(), Panier(), Profile()];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Panier",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (index) {
            setState(() {
              current = index;
            });
          },
        ),
        body: page[current],
      ),
    );
  }
}
