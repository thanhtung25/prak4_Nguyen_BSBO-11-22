import 'package:flutter/material.dart';
import 'package:myapp/DataList.dart';
import 'package:myapp/ListViewName.dart';
import 'package:myapp/ListView_Separated.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  void addItem() {
    setState(() {
      items.add(Student(name: _nameController.text, classroom: _classController.text));
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                 items.map((item) => GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.name),
                        Text(item.classroom),
                        IconButton(
                          onPressed: ()=> setState(() {
                            items.remove(item);
                          }), 
                          icon: const Icon(Icons.delete)
                          )
                      ],
                    ),
                  ),
                 ) 
                 ).toList(),
              ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color: const Color(0xffFFE7D0),
          elevation: 0,
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    color:  Color(0xffFF9E74),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const ListViewName())
                );
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color:  Color(0xffFF9E74),
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const ListViewSeparated())
                );
              },
            ),
          ],
        )
      ),
      ),  
    );
  }
}


