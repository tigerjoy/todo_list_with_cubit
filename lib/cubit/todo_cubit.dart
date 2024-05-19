import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_with_cubit/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  // Method to add todo
  void addTodo(String title) {
    if (title.isEmpty) {
      addError("Title cannot be empty!");
      return;
    }

    final Todo todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    // Always create a new list, and then pass it to emit
    // Otherwise, emit() would not update the state
    emit([...state, todo]);
  }

  // If we want to do some operation, every time the value
  // of the state changes, we can overridde the onChange handler
  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print("TodoCubit - $change");
  }

  // Any time an error occurs that can be access through this
  // method
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("TodoCubit - $error");
  }
}
