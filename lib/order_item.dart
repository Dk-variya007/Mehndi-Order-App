import 'package:flutter/material.dart';
import 'package:mehndi_order/order.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(this.order, {super.key});
  final Order order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Name : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.name}",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            heightBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Adress : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.address}",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            heightBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "City : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.city}",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            heightBox(),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Date : ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "${order.formattedDate}",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                widthBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Person : ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "${order.totalPersons}",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            ),
            heightBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "MobileNo : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.mobileno.toString()}",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            heightBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Price : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                widthBox(),
                Text(
                  "Advance : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.advance}",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            heightBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Category : ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "${order.category.displayName}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

Widget heightBox() {
  return const SizedBox(height: 4);
}

Widget widthBox() {
  return const SizedBox(width: 10);
}
