import 'package:flutter/material.dart';
import '../styles/theme.dart';

class HeaderTitle extends StatelessWidget {
	const HeaderTitle({super.key});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
			},
			child: Container(
				padding: EdgeInsets.fromLTRB(
					16,
					MediaQuery.of(context).padding.top + 6,
					16,
					6,
				),
				decoration: const BoxDecoration(
					gradient: LinearGradient(
						colors: [primaryColor, secondaryColor],
						begin: Alignment.topCenter,
						end: Alignment.bottomCenter,
					),
				),
				child: Row(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Image.asset(
							'assets/images/logo.png',
							width: 36,
							height: 36,
						),
						const SizedBox(width: 12),
						Flexible(
							child: Text(
								'La Santa Biblia',
								style: Theme.of(context).textTheme.headlineLarge?.copyWith(
											fontFamily: 'BlackKnight',
										),
							),
						),
					],
				),
			),
		);
	}
}
