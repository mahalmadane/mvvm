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
    final provideArticles = Provider.of<Modelviewarticle>(context);
    List<Article> panier = provideArticles.panier;
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
                  subtitle: Text(
                    " ${article.price}\$ *${article.quantity} = ${article.price * article.quantity}\$",
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Article supprimé du panier!")),
                    );
                    provideArticles.delete(article);
                  },
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
