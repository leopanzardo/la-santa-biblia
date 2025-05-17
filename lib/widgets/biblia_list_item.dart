import 'package:flutter/material.dart';
import '../styles/theme.dart';

class BibliaListItem extends StatelessWidget {
	final String title;
	final VoidCallback onTap;

	const BibliaListItem({super.key, required this.title, required this.onTap});

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: onTap,
			splashColor: secondaryColor.withOpacity(0.3),
			borderRadius: BorderRadius.circular(12),
			child: Container(
				margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
				padding: const EdgeInsets.all(16),
				decoration: BoxDecoration(
					color: secondaryColor.withOpacity(0.1),
					borderRadius: BorderRadius.circular(12),
					border: Border.all(color: secondaryColor.withOpacity(0.3)),
				),
				child: Text(
					title,
					style: Theme.of(context).textTheme.titleLarge,
				),
			),
		);
	}
}
