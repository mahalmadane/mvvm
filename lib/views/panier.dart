import 'package:flutter/material.dart';
import 'package:mvvm/models/cart.dart';
import 'package:mvvm/modelviews/modelviewArticle.dart';
import 'package:provider/provider.dart';

class Panier extends StatefulWidget {
  Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final panier = Provider.of<Modelviewarticle>(context).panier;
    return Scaffold(
      appBar: AppBar(title: Text("Panier")),

      body: ListView.builder(
        itemCount: panier.length,
        itemBuilder: (context, index) {
          Article article = panier[index];
          return Stack(
            alignment: Alignment.centerRight,
            children: [
              Card(
                child: ListTile(
                  title: Text(article.title),
                  leading: Image.asset(
                    article.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
