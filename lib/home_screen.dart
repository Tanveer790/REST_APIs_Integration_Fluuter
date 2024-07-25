import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<UserPhotosApi> userPhotosApi = [];

  Future<List<UserPhotosApi>> getApiPhotos () async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var jsonDataDecode = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in jsonDataDecode){
        UserPhotosApi photos = UserPhotosApi(title: i['title'], url: i['url'], id: i['id']);
        userPhotosApi.add(photos);
      }
      return userPhotosApi;
    }else{
      return userPhotosApi;
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Center(
                child: Text(
                  'APIs Integration',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getApiPhotos(),
                  builder: (context, snapshot){
                  return ListView.builder(
                      itemCount: userPhotosApi.length,
                      itemBuilder: (context , index){
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                          ),
                          title: Text(snapshot.data![index].id.toString()),
                          subtitle: Text(snapshot.data![index].title.toString()),
                        );
                      });
                },),),
            ],
          ),
        ));
  }
}

class UserPhotosApi{

  String? title,url;
  int?  id;

  UserPhotosApi({required this.title, required this.url, required this.id});


}
