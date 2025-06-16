import 'package:flutter/material.dart';
import 'package:mvvm/models/cart.dart';
import 'package:mvvm/modelviews/modelviewArticle.dart';
import 'package:provider/provider.dart';

class DetailArticle extends StatefulWidget {
  final Article article;
  const DetailArticle({super.key, required this.article});

  @override
  State<DetailArticle> createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final modelviewarticle = Provider.of<Modelviewarticle>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.title)),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 200, // 🔁 taille uniforme pour toutes les images
              width: 300, // ou 300 selon ce que tu veux
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.article.image,
                  fit: BoxFit.cover, // couvre toute la box uniformément
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.all(5),
                child: Text(
                  "\$ ${widget.article.price}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 10,

              child: ElevatedButton(
                onPressed: () {
                  modelviewarticle.ajouterPanier(widget.article);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Article ajoute au panier"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("Ajouter au panier"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
