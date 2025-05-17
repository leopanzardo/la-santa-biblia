import 'package:flutter/material.dart';
import '../styles/theme.dart';

class ScrollToTopButton extends StatelessWidget {
	final bool visible;
	final ScrollController controller;

	const ScrollToTopButton({
		super.key,
		required this.visible,
		required this.controller,
	});

	@override
	Widget build(BuildContext context) {
		if (!visible) return const SizedBox.shrink();

		return FloatingActionButton(
			onPressed: () {
				controller.animateTo(
					0,
					duration: const Duration(milliseconds: 500),
					curve: Curves.easeInOut,
				);
			},
			backgroundColor: secondaryColor,
			child: const Icon(Icons.arrow_upward),
		);
	}
}
