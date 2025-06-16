import 'package:flutter/material.dart';
import 'package:mvvm/models/cart.dart';

class Modelviewarticle extends ChangeNotifier {
  List<Article> articles = [
    Article(
      id: 1,
      title: "Pomme",
      description: "Pomme rouge",
      price: 11.5,
      image: "image/pomme.jpg",
      quantity: 13,
    ),
    Article(
      id: 2,
      title: "Savon",
      description: "Savon liquide",
      price: 11.5,
      image: "image/savon.jpg",
      quantity: 13,
    ),
  ];
  List<Article> panier = [];
  //Afficher
  void afficherArticles() {
    articles;
    notifyListeners();
  }

  //Ajouter

  //Supprimer

  //Modifier

  //Ajouter au panier
  void ajouterPanier(Article article) {
    panier.add(article);
    notifyListeners();
  }
}
