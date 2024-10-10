import 'package:flutter/material.dart';
import 'package:expense_traacker/widgets/expenses_list/expenses_item.dart';
import 'package:expense_traacker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense, // Add this line
  });

  final List<Expense> expenses;
  final void Function(Expense expense)
      onRemoveExpense; // Define onRemoveExpense

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]); // Call the callback on dismiss
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
