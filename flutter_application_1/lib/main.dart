
import 'package:flutter/material.dart';
import 'package:flutter_application_1/todocontorller.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => todoconto()),
      ],
      child: MaterialApp(
        home: MyApp()
        ));
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      final todoproviderrrr = Provider.of<todoconto>(context,listen: false);
      final text = TextEditingController();
return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('TODO app'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: ()async {
                   showDialog(context: context, builder: (context){
                    return AlertDialog(content: Column(children: [
Expanded(child: TextField( 
  controller: text,
  decoration: InputDecoration(hintText: "Enter tile"),
  
)
)
,
IconButton(onPressed: (){
  todoproviderrrr.addTodo(text.text);
  Navigator.pop(context);
}, icon: Icon(Icons.save))

                    ],),);
                   });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Consumer<todoconto>(
                builder: (context, todoprovider, child) {
                  return ListView.builder(
                    itemCount: todoprovider.gettodo.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrangeAccent,
                            ),
                            child: Text("${todoprovider.gettodo[index]}"), // Corrected the syntax error here
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              todoprovider.deletetodo(index);
                            },
                            icon: Icon(Icons.delete_forever),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ));
  }

}
