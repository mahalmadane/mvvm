import 'package:flutter/material.dart';
import 'package:mvvm/models/cart.dart';

class Modelviewarticle extends ChangeNotifier{
  List<Article> articles=[
   Article(id:1, title: "Pomme", description: "Pomme rouge", price: 11.5, image: "", quantity: 13)

  ];

//Afficher
List<Article> afficherArticles(){
  return articles;
}

//Ajouter

//Supprimer

//Modifier
}