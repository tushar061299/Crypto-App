import 'package:crypto_app/model/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=bitcoin&from=2021-06-20&sortBy=publishedAt&apiKey=ef1f8599f9834e9ba01fe6fd7b47790a";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        // ignore: unnecessary_null_comparison
        Article article = Article(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          urlToImage: element['urlToImage'],
          publshedAt: DateTime.parse(element['publishedAt']),
          content: element["content"],
          articleUrl: element["url"],
        );
        news.add(article);
      });
    }
  }
}


// class NewsForCategorie {

//   List<Article> news  = [];

//   Future<void> getNewsForCategory(String category) async{

//     /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
//     String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

//     var response = await http.get(Uri.parse(url));

//     var jsonData = jsonDecode(response.body);

//     if(jsonData['status'] == "ok"){
//       jsonData["articles"].forEach((element){

//         if(element['urlToImage'] != null && element['description'] != null){
//           Article article = Article(
//             title: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }

//       });
//     }


//   }


// }