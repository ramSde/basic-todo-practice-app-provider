import 'package:flutter/material.dart';

class todoconto extends ChangeNotifier {
List<String> todo = [];



List<String>  get  gettodo=> todo;

void addTodo(String task){
todo.add(task);
notifyListeners();
}

void deletetodo(int index){
todo.removeAt(index);
notifyListeners();
}

void updateTodo(int index,String newtitle){
  todo[index] = newtitle;
  notifyListeners();
}





}