import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpPostApi extends StatefulWidget {
  const SignUpPostApi({super.key});

  @override
  State<SignUpPostApi> createState() => _SignUpPostApiState();
}

class _SignUpPostApiState extends State<SignUpPostApi> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password)async{
    try{
      
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email': email,
          'password': password,
        }
      );
      if(response.statusCode == 200){
        print('registered success');
      }else{
        print('failed');
      }
      
    }catch(e){
      print(e.toString());
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: const Text('Sign up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'email',
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'password',
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  login(emailController.text.toString(), passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Text('Sign up'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
