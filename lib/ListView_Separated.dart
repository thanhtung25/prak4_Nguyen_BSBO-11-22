import 'package:flutter/material.dart';
import 'package:myapp/DataList.dart';

class ListViewSeparated extends StatefulWidget{
  const ListViewSeparated({super.key});

  @override
  State<ListViewSeparated> createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  void addItem() {
    setState(() {
      items.add(Student(name: _nameController.text, classroom: _classController.text));
    });
  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Todo ListView Separated"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(items[index].name),
                  subtitle: Text(items[index].classroom),
                  trailing: IconButton(
                    onPressed: ()=> setState(() {
                                  items.remove(items[index]);
                                }), 
                    icon:const Icon(Icons.delete),
                    ),
                );
              },
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              ),
          ),
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