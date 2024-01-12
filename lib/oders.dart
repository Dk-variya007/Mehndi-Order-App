import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mehndi_order/new_order.dart';
import 'package:mehndi_order/order.dart';
import 'package:mehndi_order/order_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final List<Order> _registerorder = [
    Order(
        address: "xyz",
        advance: 400,
        category: Categore.engagement,
        date: DateTime.now(),
        mobileno: 12345678910,
        name: "Hansaben Bharatbhai Parmar",
        price: 7000,
        city: 'Surat',
        totalPersons: 10),
  ];
  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'orders';
    final List<String>? ordersJson = prefs.getStringList(key);

    if (ordersJson != null) {
      setState(() {
        _registerorder.clear();
        _registerorder
            .addAll(ordersJson.map((json) => Order.fromJson(jsonDecode(json))));
      });
    }
  }

  Future<void> _saveOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'orders';
    final ordersJson =
        _registerorder.map((order) => jsonEncode(order.toJson())).toList();
    prefs.setStringList(key, ordersJson);
  }

  void _addNewOrder(Order order) {
    setState(() {
      _registerorder.add(order);
      _saveOrders(); // Save orders to shared preferences
    });
  }

  void _removeOrder(Order order) {
    final orderIndex = _registerorder.indexOf(order);
    setState(() {
      _registerorder.remove(order);
      _saveOrders(); // Save orders to shared preferences
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Order deleted"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _registerorder.insert(orderIndex, order);
            _saveOrders(); // Save orders to shared preferences
          });
        },
      ),
    ));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true, // akhi screen ma avi jay
        context: context,
        builder: (ctx) => NewOrder(onAddOrder: _addNewOrder));
  }

  @override
  Widget build(BuildContext context) {
    Widget? maincontent;
    maincontent = _registerorder.isNotEmpty
        ? maincontent =
            OrderList(onRemoveOrder: _removeOrder, orders: _registerorder)
        : Center(
            child: Text("No Order Found. Start adding Order",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.deepPurple)));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "list Of Order",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          backgroundColor: const Color(0xff4F6F52),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
          ],
        ),
        backgroundColor:
            const Color(0xffFAE7F3), //const Color.fromARGB(255, 246, 223, 246),
        body: maincontent);
  }
}
