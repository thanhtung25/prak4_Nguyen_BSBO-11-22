// ignore: file_names

import 'package:flutter/material.dart';
import 'package:myapp/DataList.dart';
import 'package:myapp/prak9/MyInheritWidget_data.dart';
import 'package:myapp/prak9/locator.dart';
import 'package:myapp/prak9/netword_Service.dart';
class ListViewName extends StatefulWidget{
  const ListViewName({super.key});

  @override
  State<ListViewName> createState() => _ListViewNameState();
}

class _ListViewNameState extends State<ListViewName> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  void addItem() {
    
    setState(() {
      String add = locator<NetwordSevice>().add();
      Student.items.add(Student(name: _nameController.text, classroom: _classController.text));
      print(add);
    });
  }
  @override
  Widget build(BuildContext context){
    var data = MyInheritWidget.of(context)?.data;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Todo ListView"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index){
                      return ListTile(
                        title: Text(data[index].name),
                        subtitle: Text(data[index].classroom),
                        trailing: IconButton(
                          onPressed: ()=> setState(() {
                            String delete = locator<NetwordSevice>().delete();
                            Student.items.remove(data[index]);
                            print(delete);
                            }), 
                          icon:const Icon(Icons.delete),
                          ),
                      );
                    },
                    itemCount: data!.length,

              // itemBuilder: (context, index) => CachedNetworkImage(
              //   key: UniqueKey(),
              //   imageUrl: "https://reqres.in/img/faces/${index+1}-image.jpg",
              //   width: 80,
              //   height: 80,
              //   fit: BoxFit.contain,
              //   )
                ),
          ),
          //https://reqres.in/img/faces/${index+1}-image.jpg
          Padding(
                  padding:const EdgeInsets.fromLTRB(10,30,10,20),
                  child: TextField(
                    controller: _nameController,
                    style:const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration:const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:EdgeInsets.all(10),
                      labelText: "Name",
                      prefixIcon:SizedBox(
                        width: 50,child: Icon(Icons.person),
                      ),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white,width: 1)
                      )
                    ),
                  ),
                ),

                 Padding(
                  padding:const EdgeInsets.fromLTRB(10,10,10,100),
                  child: TextField(
                    controller: _classController,
                    style:const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration:const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:EdgeInsets.all(10),
                      labelText: "Class",
                      prefixIcon:SizedBox(
                        width: 50,child: Icon(Icons.person),
                      ),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white,width: 1)
                      )
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF9E74),
        onPressed: addItem,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 2.0,
        child:  const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ) ,
      
    );
  }
}