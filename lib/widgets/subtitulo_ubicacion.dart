import 'package:flutter/material.dart';

class SubtituloUbicacion extends StatelessWidget {
	final String texto;

	const SubtituloUbicacion({super.key, required this.texto});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
			child: Text(
				texto,
				style: Theme.of(context).textTheme.titleLarge,
			),
		);
	}
}
