import 'dart:async';
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
  late Animation<Offset> _titleSlideAnimation;

  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Create staggered animations for each text field
    // _opacityAnimations = List.generate(4, (index) {
    //   final start = index * 0.15; // More space between animations
    //   final end = start + 0.5; // Allow enough time for each to animate
    //   return Tween<double>(begin: 0.0, end: 1.0).animate(
    //     CurvedAnimation(
    //       parent: _animationController,
    //       curve: Interval(start, end.clamp(0.0, 1.0), curve: Curves.easeInOut),
    //     ),
    //   );
    // });

    // Title animation after the sheet is in
    _titleSlideAnimation = Tween<Offset>(
      // begin: const Offset(-1.5, 0),
      begin: const Offset(1.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6,
          0.85, // Delayed & smooth
          curve: Curves.easeOut,
        ),
      ),
    );

    // Custom text fields: slide from bottom with bounce
    _slideAnimations = List.generate(4, (index) {
      double start = 0.55 + index * 0.1;
      double end = start + 0.15;

      return Tween<Offset>(
        begin: const Offset(0, 0.6),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.easeOutBack),
        ),
      );
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeBottomSheet() {
    _animationController.reverse().then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            (1 - _animationController.value) *
                MediaQuery.of(context).size.height,
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
            SlideTransition(
              position: _titleSlideAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add New Goal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _closeBottomSheet,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Animated Text Fields
            ...List.generate(4, (index) {
              return SlideTransition(
                position: _slideAnimations[index],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildTextField(index),
                ),
              );
            }),
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

  Widget _buildTextField(int index) {
    switch (index) {
      case 0:
        return const CustomTextField(
          labelText: 'Title',
          prefixIcon: Icons.title,
        );
      case 1:
        return const CustomTextField(
          labelText: 'Category',
          prefixIcon: Icons.category,
        );
      case 2:
        return const CustomTextField(
          labelText: 'Goal Amount',
          prefixIcon: Icons.attach_money,
          keyboardType: TextInputType.number,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
