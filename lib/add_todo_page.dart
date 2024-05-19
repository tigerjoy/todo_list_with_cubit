import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_with_cubit/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Shorter version would be
    // context.read<TodoCubit>();
    final TodoCubit todoCubit = BlocProvider.of<TodoCubit>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: todoTitleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  todoCubit.addTodo(todoTitleController.text.trim());
                  Navigator.pushNamed(context, "/");
                },
                child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
