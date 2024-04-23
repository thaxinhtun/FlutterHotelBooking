import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/widget/custom_payment_list.dart';

class ViewPaymentTransactions extends StatefulWidget {
  const ViewPaymentTransactions({super.key});

  @override
  State<ViewPaymentTransactions> createState() =>
      _ViewPaymentTransactionsState();
}

class _ViewPaymentTransactionsState extends State<ViewPaymentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today Payment Transactions",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            // rows of payment list
            children: [
              CustomPaymentList(
                icon: Icons.person,
                name: 'Name',
                payDate: 'Date Time',
                amount: 'Amount',
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
