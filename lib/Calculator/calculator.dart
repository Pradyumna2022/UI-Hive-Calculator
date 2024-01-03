import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

 class CalculationHistory {
  final String operation;
  final String result;

  CalculationHistory({required this.operation, required this.result});
}

class _CalculatorState extends State<Calculator> {
  num z = 0;
  final firstNumController = TextEditingController();
  final secondNumberController = TextEditingController();
  List<CalculationHistory> history = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              controller: firstNumController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: 'Enter First Number'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.phone,
              controller: secondNumberController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: 'Enter Second Number'
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                z.toString(),
                style: TextStyle(fontSize: 100, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            FloatingActionButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryScreen(history: history),
              ),
            );},child: Text("History",
            style: TextStyle(
              color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold
            ),),backgroundColor: Colors.amber,),
            SizedBox(height: 82,),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      performOperation('+');
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      performOperation('-');
                    },
                    child: Icon(CupertinoIcons.minus),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      performOperation('*');
                    },
                    child: Icon(CupertinoIcons.multiply),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      performOperation('/');
                    },
                    child: Icon(CupertinoIcons.divide),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            FloatingActionButton(
              onPressed: () {
                clearInput();
              },
              child: Text("Clear"),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

  void performOperation(String operator) {
    try {
      num result = 0;
      switch (operator) {
        case '+':
          result = int.parse(firstNumController.text) + int.parse(secondNumberController.text);
          break;
        case '-':
          result = int.parse(firstNumController.text) - int.parse(secondNumberController.text);
          break;
        case '*':
          result = int.parse(firstNumController.text) * int.parse(secondNumberController.text);
          break;
        case '/':
          result = int.parse(firstNumController.text) / int.parse(secondNumberController.text);
          break;
      }

      setState(() {
        z = result;
        history.add(CalculationHistory(operation: '$operator', result: '$result'));
      });
    } catch (e) {
      // Handle invalid input or division by zero
      print(e.toString()+'------------------------------------');
    }
  }

  void clearInput() {
    firstNumController.clear();
    secondNumberController.clear();
    setState(() {});
  }
}

class HistoryScreen extends StatelessWidget {
  final List<CalculationHistory> history;

  const HistoryScreen({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation History'),
      ),
      body: history.isNotEmpty ?ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${history[index].operation}: ${history[index].result}'),

          );
        },
      ): Center(child: Text("Please Calcualate Something",style: TextStyle(
        fontWeight: FontWeight.bold,color: Colors.red,fontSize: 25
      ),))
    );
  }
}
