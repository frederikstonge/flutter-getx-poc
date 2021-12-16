import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartItem extends StatefulWidget {
  final String productId;
  final bool editMode;
  final Function(int) onSubmit;
  final int quantity;

  const CartItem(this.productId, this.onSubmit,
      {this.quantity = 1, this.editMode = false, Key? key})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                initialValue: widget.quantity.toString(),
                decoration: const InputDecoration(
                  labelText: "Quantity",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  var qty = int.tryParse(value);
                  setState(() {
                    quantity = qty ?? 0;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: quantity != 0 ? () => widget.onSubmit(quantity) : null,
              child: Text(widget.editMode ? "Update item" : "Add to cart"),
            ),
          )
        ],
      ),
    );
  }
}
