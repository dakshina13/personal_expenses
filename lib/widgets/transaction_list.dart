import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print("Build() transaction.dart");
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  "No Transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        // : ListView.builder(
        //     itemBuilder: (context, index) {
        //       // return Card(
        //       //   child: Row(
        //       //     children: <Widget>[
        //       //       Container(
        //       //         margin: EdgeInsets.symmetric(
        //       //           vertical: 10,
        //       //           horizontal: 15,
        //       //         ),
        //       //         padding: EdgeInsets.all(10),
        //       //         decoration: BoxDecoration(
        //       //           border: Border.all(
        //       //             color: Theme.of(context).primaryColor,
        //       //             width: 2,
        //       //           ),
        //       //         ),
        //       //         child: Text(
        //       //           '\$${transactions[index].amount.toStringAsFixed(2)}',
        //       //           style: TextStyle(
        //       //             fontWeight: FontWeight.bold,
        //       //             fontSize: 20,
        //       //             color: Theme.of(context).primaryColor,
        //       //           ),
        //       //         ),
        //       //       ),
        //       //       Column(
        //       //         children: <Widget>[
        //       //           Text(
        //       //             transactions[index].title,
        //       //             style: Theme.of(context).textTheme.headline6,
        //       //           ),
        //       //           Text(
        //       //             DateFormat.yMMMd().format(transactions[index].date),
        //       //             style: TextStyle(
        //       //               color: Colors.grey,
        //       //             ),
        //       //           ),
        //       //         ],
        //       //         crossAxisAlignment: CrossAxisAlignment.start,
        //       //       )
        //       //     ],
        //       //   ),
        //       // );
        //       return TransactionItem(
        //         transaction: transactions[index],
        //         deleteTx: deleteTx,
        //       );
        // },
        //             itemCount: transactions.length,
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
  }
}
