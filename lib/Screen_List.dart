import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/DataList.dart';
import 'package:myapp/cubit/student_cubit.dart';

class ScreenList extends StatefulWidget{
  const ScreenList({super.key});

  @override
  State<ScreenList> createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  void addItem() {
    setState(() {
      Student.items.add(Student(name: _nameController.text, classroom: _classController.text));
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children:
            //        Student.items.map((data) => GestureDetector(
            //         child: Padding(
            //           padding: const EdgeInsets.all(16),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(data.name),
            //               Text(data.classroom),
            //               IconButton(
            //                 onPressed: ()=> setState(() {
            //                   Student.items.remove(data);
            //                 }), 
            //                 icon: const Icon(Icons.delete)
            //                 )
            //             ],
            //           ),
            //         ),
            //        ) 
            //        ).toList(),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  context.read<StudentCubit>().filterStudnts(value);
                },
                decoration:const InputDecoration(
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<StudentCubit,StudentState>(
                builder: (context, state){
                  if(state is StudentInitialState){
                    return buildStudentList(state.students);
                  }
                  else if(state is StudentFilterdState){
                    return buildStudentList(state.filterdStudents);
                  }
                  return Container();
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
                        labelText: "",
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
     
    );
  }

  Widget buildStudentList(List<Student> students){
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index){
        final student = students[index];
        return ListTile(
          title: Text(student.name),
          subtitle: Text(student.classroom),
          trailing: IconButton(
            onPressed: ()=> setState(() {
            Student.items.remove(students[index]);
            }), 
           icon:const Icon(Icons.delete),
          ),
        );
      }
      );
  }
}