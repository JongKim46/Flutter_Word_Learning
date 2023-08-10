import 'package:flutter/material.dart';
import 'package:wordflutter/screen/time_select_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("JLPT単語学習"),
          centerTitle: true,
        ),
        body:SizedBox(
            width:double.infinity,
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children:[
                SizedBox(
                  width:210,
                  height:60,
                  child:Padding(
                    padding:const EdgeInsets.all(5.0,),
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => TimeSelect('N5')),
                        );
                      },
                      child:const Text('N5'),
                    ),
                  ),
                ),
                SizedBox(
                  width:210,
                  height:60,
                  child:Padding(
                    padding:const EdgeInsets.all(5.0,),
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimeSelect('N4')),
                        );
                      },
                      child:const Text('N4'),
                    ),
                  ),
                ),
                SizedBox(
                  width:210,
                  height:60,
                  child:Padding(
                    padding:const EdgeInsets.all(5.0,),
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimeSelect('N3')),
                        );
                      },
                      child:const Text('N3'),
                    ),
                  ),
                ),
                SizedBox(
                  width:210,
                  height:60,
                  child:Padding(
                    padding:const EdgeInsets.all(5.0,),
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimeSelect('N2')),
                        );
                      },
                      child:const Text('N2'),
                    ),
                  ),
                ),
                SizedBox(
                  width:210,
                  height:60,
                  child:Padding(
                    padding:const EdgeInsets.all(5.0,),
                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimeSelect('N1')),
                        );
                      },
                      child:const Text('N1'),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}