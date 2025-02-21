import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController(); //? creates an object optimized for text input
  final _amountController = TextEditingController();

  //? delete the controller when the widget is removed from the widget tree
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Title"),
              suffix: IconButton(
                onPressed: () => _titleController.clear(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: const Text("Amount"),
              prefixText: "₹",
              suffix: IconButton(
                onPressed: () => _amountController.clear(),
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("Cancel")),
              ElevatedButton(onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
              }, child: const Text("Add Expense")),
            ],
          )
        ],
      ),
    );
  }
}