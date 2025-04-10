import 'package:_12_animated_app/components/custom_button.dart';
import 'package:_12_animated_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddGoalBottomSheet extends StatefulWidget {
  const AddGoalBottomSheet({super.key});

  @override
  State<AddGoalBottomSheet> createState() => _AddGoalBottomSheetState();
}

class _AddGoalBottomSheetState extends State<AddGoalBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward(); // Start the opening animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeBottomSheet() {
    _animationController.reverse().then((_) {
      Navigator.of(context).pop(); // Close the bottom sheet after animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            (1 - _animation.value) * MediaQuery.of(context).size.height,
          ),
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Adjusts height to fit content
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add New Goal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _closeBottomSheet, // Trigger the closing animation
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CustomTextField(labelText: 'Title', prefixIcon: Icons.title),
            const SizedBox(height: 15),
            const CustomTextField(
              labelText: 'Category',
              prefixIcon: Icons.category,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              labelText: 'Current Amount',
              prefixIcon: Icons.currency_rupee,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              labelText: 'Goal Amount',
              prefixIcon: Icons.attach_money,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomButton(
                onPressed: _closeBottomSheet, // Optionally close after adding
                text: "Add Goal",
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
