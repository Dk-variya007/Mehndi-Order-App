import 'package:flutter/material.dart';
import 'package:mehndi_order/order.dart';
import 'package:mehndi_order/order_item.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key ,required this.onRemoveOrder,required this.orders});
  final List<Order> orders;
  final void Function(Order order) onRemoveOrder;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (ctx, index) => Dismissible(
          //Dissmissible no use expense ne  delet karva thay che tene left k right swipe karvathi te delete thay jay che
          key: ValueKey(orders[index]),
          background: Container(color:Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),),
          onDismissed: (direction) {
            onRemoveOrder(orders[index]);
          },
          child: OrderItem(orders[index])
          ),
    );
  }
}