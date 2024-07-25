import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetApiWithoutModel extends StatefulWidget {
  const GetApiWithoutModel({super.key});

  @override
  State<GetApiWithoutModel> createState() => _GetApiWithoutModelState();
}

class _GetApiWithoutModelState extends State<GetApiWithoutModel> {
  
  List<GetApiWithOutModel> model = [];
  Future<List<GetApiWithOutModel>> getApi()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        model.add(GetApiWithOutModel(title: i['title'], url: i['url']));
      }
      return model;
    }else{
      return model;
    }
  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              centerTitle: true,
              title: const Text(
                'APIs Integration',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: getApi(),
                      builder: (context,AsyncSnapshot<List<GetApiWithOutModel>> snapshot){
                        return ListView.builder(
                            itemCount: model.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                                ),
                                title: Text(snapshot.data![index].title.toString()),
                              );
                            });
                  }),
                )
              ],
            )
        ));
  }
}

class GetApiWithOutModel {
  String? title, url;
  GetApiWithOutModel({required this.title, required this.url});
}
