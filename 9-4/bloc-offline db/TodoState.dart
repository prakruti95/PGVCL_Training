import 'package:bloc11/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable
{
  @override
  List<Object?> get props => [];
}
class TodoInitialState extends TodoState
{}
class TodoLoadedState extends TodoState
{
  final List<Todo> todos;
  TodoLoadedState({required this.todos});



  @override
  // TODO: implement props
  List<Object?> get props => [todos];

}