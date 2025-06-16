import 'package:flutter/material.dart';
import 'package:mvvm/models/cart.dart';
import 'package:mvvm/modelviews/modelviewArticle.dart';
import 'package:mvvm/views/detail.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    Modelviewarticle().afficherArticles();
  }


  @override
  Widget build(BuildContext context) {
     final modelviewarticle = Provider.of<Modelviewarticle>(context);
    articles = modelviewarticle.articles;
    return Scaffold(
      appBar: AppBar(title: Text("Articles")),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Article article = articles[index];
          return GestureDetector(
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => DetailArticle(article: article))),
            child: Card(
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
          );
        },
      ),
    );
  }
}
