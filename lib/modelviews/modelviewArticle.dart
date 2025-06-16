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
  void delete(Article article) {
    for (Article art in panier) {
      if (art.id == article.id && art.quantity > 1) {
        art.quantity--;
        break;
      }
    }
    if (article.quantity == 0) {
      panier.remove(article);
    }
    notifyListeners();
  }

  //Modifier

  //Ajouter au panier
  void ajouterPanier(Article article) {
    bool exist = false;
    for (Article art in panier) {
      if (art.id == article.id) {
        exist = true;
        art.quantity++;
        break;
      }
    }
    if (!exist) {
      panier.add(article);
    }
    notifyListeners();
  }
}
