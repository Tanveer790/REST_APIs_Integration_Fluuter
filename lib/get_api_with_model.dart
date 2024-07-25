import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/GetApiModel.dart';


class GetApiWithModel extends StatefulWidget {
  const GetApiWithModel({super.key});

  @override
  State<GetApiWithModel> createState() => _GetApiWithModelState();
}

class _GetApiWithModelState extends State<GetApiWithModel> {
  List<GetApiModel> getApiModel = [];
  Future<List<GetApiModel>> getApi ()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
         getApiModel.add(GetApiModel.fromJson(i));
      }
      return getApiModel;
    }else{
      return getApiModel;
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
                    future: getApi(),
                    builder: (context , snapshot){
                      return ListView.builder
                        (
                          itemCount: getApiModel.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              leading: Text(snapshot.data![index].id.toString()),
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
