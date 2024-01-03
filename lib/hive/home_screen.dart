import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vinay/hive/boxes.dart';
import 'package:vinay/hive/notesmodel/notes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hive Tutorials'
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body:
      ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context,box,_) {
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
              itemCount: box.length ,
              itemBuilder: (context,index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[
                        Text(data[index].title),
                        Spacer(),
                        IconButton(onPressed: (){
                          _editDialog(data[index],data[index].title.toString(),data[index].description.toString());

                        }, icon: Icon(Icons.edit)),
                        SizedBox(width: 10,),
                        IconButton(onPressed: (){
                          deleteItem(data[index]);
                        }, icon: Icon(Icons.delete,color: Colors.red,)),
                      ]
                    ),
                    Text(data[index].description),

                  ],
                ),
              ),
            );
          });
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showMyDialog();
        },child: Icon(Icons.hive),
      ),
    );
  }

  Future<void> _showMyDialog()async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: 'First'
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: secondController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Second'
                ),
              )
            ],
          ),
        ),
        title: Text("Add New Notes"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){
            final data = NotesModel(title: firstController.text, description: secondController.text);
            final box = Boxes.getData();
            box.add(data);
            data.save();
            print(data);
            firstController.clear();
            secondController.clear();
            print(box.get('0').toString()+'----------------------');
            Navigator.pop(context);
          }, child: Text("Add")),
        ],
      );
    });
  }

  Future<void> _editDialog(NotesModel notesModel, String title, String description)async{

    firstController.text = title;
    secondController.text = description;
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'First'
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: secondController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Second'
                ),
              )
            ],
          ),
        ),
        title: Text("Edit dialog"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: ()async{
            notesModel.title = firstController.text.toString();
            notesModel.description = secondController.text.toString();
            notesModel.save();
            firstController.clear();
            secondController.clear();
            Navigator.pop(context);
          }, child: Text("Edit")),
        ],
      );
    });
  }

  void deleteItem(NotesModel notesModel)async {
    await notesModel.delete();
  }
}
