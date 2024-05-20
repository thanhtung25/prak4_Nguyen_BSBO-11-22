part of 'student_cubit.dart';

sealed class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

final class StudentInitialState extends StudentState {
  final List<Student> students;

  const StudentInitialState({required this.students});
}

final class StudentFilterdState extends StudentState {
  final List<Student> filterdStudents;

  const StudentFilterdState({required this.filterdStudents});
}
