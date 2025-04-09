import 'package:bloc11/todo.dart';
import 'package:bloc11/todobloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TodoEvent.dart';
import 'TodoState.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      title: 'Flutter Todo App with BLoC',
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider
        (
        create: (context) => TodoBloc(),
        child:  TodoScreen(),
        ),
      );
  }
}
class TodoScreen extends StatefulWidget
{

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Todolist - Bloc"),),
        body: Column
          (
            children:
            [

              Padding
                (
                  padding: const EdgeInsets.all(16.0),
                  child: Row
                    (
                      children:
                      [

                        Expanded(
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: const InputDecoration(
                              labelText: 'Enter a new task',
                            ),
                            onSubmitted: (text)
                            {
                              if (text.isNotEmpty)
                              {
                                final newTodo = Todo(task: text);//set
                                context.read<TodoBloc>().add(AddTodoEvent(newTodo));

                              }
                            },
                          ),
                        ),
                        // IconButton(
                        //   icon: const Icon(Icons.add),
                        //   onPressed: () {
                        //     final text = TextEditingController().text;
                        //     if (text.isNotEmpty) {
                        //       // final newTodo = Todo(task: text);
                        //       // context.read<TodoBloc>().add(AddTodoEvent(newTodo));
                        //     }
                        //   },
                        // ),
                      ],
                    ),),
              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoLoadedState)
                    {
                      return ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index)
                        {
                          final todo = state.todos[index];
                          return ListTile(
                            title: Text(
                                todo.task,
                              style: TextStyle(
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),

                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<TodoBloc>().add(RemoveTodoEvent(index));
                              },
                            ),
                            onTap: () {
                              context.read<TodoBloc>().add(ToggleTodoEvent(index));
                            },
                          );
                        },
                      );
                    }
                     else {
                       return const Center(child: Text('No Todos'));
                     }
                  },
                ),
              ),


            ],
          ),
      );
  }
}

