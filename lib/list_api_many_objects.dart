import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/ListWithManyObjects.dart';


class ListWitObjects extends StatefulWidget {
  const ListWitObjects({super.key});

  @override
  State<ListWitObjects> createState() => _ListWitObjectsState();
}

class _ListWitObjectsState extends State<ListWitObjects> {
  
  List<ListWithManyObjects> userModel = [];
  
  Future<List<ListWithManyObjects>> getApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userModel.add(ListWithManyObjects.fromJson(i));
      }
      return userModel;
    }else{
      return userModel;
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              centerTitle: true,
              title: const Text(
                'APIs Integration',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                        future: getApi(),
                        builder: (context , snapshot){
                      return ListView.builder(
                        itemCount: userModel.length,
                          itemBuilder: (context , index){
                        return Card(
                          color: Colors.black45,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                UserRow(title: 'name:', value: snapshot.data![index].name.toString()),
                                SizedBox(height: 10,),
                                UserRow(title: 'username:', value: snapshot.data![index].username.toString()),

                                SizedBox(height: 10,),
                                UserRow(title: 'city:', value: snapshot.data![index].address!.city.toString()),

                                SizedBox(height: 10,),
                                UserRow(title: 'email:', value: snapshot.data![index].email.toString()),

                                SizedBox(height: 10,),
                                UserRow(title: 'Address', value: snapshot.data![index].address!.geo!.lat.toString(),)



                              ],
                            ),
                          ),
                        );
                      });
                    }),
                  )
                ],
              ),
            )
        ));
  }
}


class UserRow extends StatelessWidget {
  String title, value;
  UserRow({super.key, required this.title , required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.white),),
        Text(value, style: TextStyle(color: Colors.white),),
      ],
    );
  }
}

