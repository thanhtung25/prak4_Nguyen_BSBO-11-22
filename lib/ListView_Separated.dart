// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/ApiServiceProvider.dart';
import 'package:myapp/model/ApiStudent.dart';

import 'DataList.dart';

class ListViewSeparated extends StatefulWidget{
  const ListViewSeparated({super.key});

  @override
  State<ListViewSeparated> createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  ApiServiceProvider _apiServiceProvider =  ApiServiceProvider();
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
            // child: ListView.separated(
            //   itemBuilder: (context, index){
            //     return ListTile(
            //       title: Text(items[index].name),
            //       subtitle: Text(items[index].classroom),
                  // trailing: IconButton(
                  //   onPressed: ()=> setState(() {
                  //                 items.remove(items[index]);
                  //               }), 
                  //   icon:const Icon(Icons.delete),
                  //   ),
            //     );
            //   },
            //   itemCount: items.length,
            //   separatorBuilder: (context, index) {
            //     return const Divider();
            //   },
            //   ),
            child: FutureBuilder(
              future: _apiServiceProvider.getUser(), 
              builder: (BuildContext context, AsyncSnapshot<ApiStudent> snapshot){
                if(snapshot.hasData){
                  List<Data>? list = snapshot.data!.data;
                  return ListView.separated(
                    itemBuilder: (context, index){
                      Data user = list[index];
                      return ListTile(
                        // ignore: prefer_interpolation_to_compose_strings
                        title:  Text(user.firstName.toString() + " " + user.lastName.toString()),
                        subtitle: Text(user.email.toString()),
                        leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar.toString())),
                        // leading: CachedNetworkImage(
                        //   imageUrl: user.avatar.toString(),
                        //   width: 100,
                        //   height: 100,
                        //   fit:BoxFit.fitHeight,
                        //   placeholder: (context, url) => Container(color: Colors.black12,),
                        //   errorWidget: (context, url, error) => Container(
                        //     color: Colors.black12,
                        //     child: const Icon(Icons.error, color: Colors.red, size: 15,), 
                        //   ),
                        //   ),
                        trailing: IconButton(
                          // onPressed: ()=> setState(() {
                          //         list.remove(list[index]);
                          //       }), 
                          onPressed: () {
                            
                          },
                          icon:const Icon(Icons.delete),
                        ),
                      );
                    }, 
                    separatorBuilder: (context, index){
                      return const Divider();
                    },
                    itemCount: list!.length
                    );
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              }
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