import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  final bool _compact;

  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;

  const DeliveryIncrementDecrementButton.compact({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(8) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: _compact
                ? const EdgeInsets.symmetric(horizontal: 8)
                : const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: _compact ? 20 : 24,
              height: _compact ? 20 : 24,
              child: IconButton(
                iconSize: _compact ? 14 : 18,
                onPressed: decrementTap,
                icon: const Icon(Icons.remove),
              ),
            ),
          ),
          SizedBox(
            width: _compact ? 16 : 0,
            child: Center(
              child: Text(
                amount.toString(),
                style: context.textStyles.textRegular.copyWith(
                  fontSize: _compact ? 13 : 17,
                  color: context.colors.secondary,
                ),
              ),
            ),
          ),
          Padding(
            padding: _compact
                ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
                : const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: _compact ? 20 : 24,
              height: _compact ? 20 : 24,
              child: IconButton(
                iconSize: _compact ? 14 : 18,
                onPressed: incrementTap,
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
