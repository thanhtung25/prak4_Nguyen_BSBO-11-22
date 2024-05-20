import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/DataList.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitialState(students: Student.items ));
  void filterStudnts(String name){
    if(name.isEmpty){
      emit(StudentInitialState(students: Student.items));
    }else{
      final filteredList = Student.items.where((student) => student.name
          .toString()
          .toLowerCase()
          .contains(name.toLowerCase()))
      .toList();
      emit(StudentFilterdState(filterdStudents: filteredList));
    }
  }
}
