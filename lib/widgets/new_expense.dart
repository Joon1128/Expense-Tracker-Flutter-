import 'package:flutter/material.dart';
import 'package:app3/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }

  // @override
  // State<StatefulWidget> createState() => _NewExpense();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now(); //현재 시각
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    //사용자가 날짜를 선택하면 DateTime객체 반환, 취소하면 null반환
    final pickedDate = await showDatePicker(
      //날짜 선택 UI
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(
      // tryParse('Hello') => null
      // tryParse('1.12) => 1.12
      //returns null for invalid inputs
      _amountController.text,
    );
    final amountIsInvalid =
        enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error message
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController, // 値が変わるたびに実行される関数
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller:
                      _amountController, // 値が変わるたびに実行される関数
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ', //入力値の前に'$'をつける。
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(
                              _selectedDate!, //null이 아님
                            ),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items:
                    Category //  Category.values --> Category라는 enum타입의 값들을 담고 있는 리스트
                        .values //enum에 붙어있는 모든 항목 목록. ex)
                        //[
                        // Category.food,
                        // Category.travel,
                        // Category.leisure,
                        // Category.work,
                        //  ]
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  //사용자가 드롭다운에서 항목을 선택했을때 선택된 항목의 값
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: Text('Save Expense'),
              ), // child --> button contents
            ],
          ),
        ],
      ),
    );
  }
}
