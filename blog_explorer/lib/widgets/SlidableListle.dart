import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListile extends StatelessWidget {
  const SlidableListile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      endActionPane: ActionPane(
        motion: ScrollMotion(),
        dragDismissible: true,
        dismissible: DismissiblePane(onDismissed: () {
          print("what is your name");
        }),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.red,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: const ListTile(title: Text('Slide me')),
    );
  }
}
