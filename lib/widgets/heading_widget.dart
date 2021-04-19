// Baka Anime - A Simple Demonstration App for Kitsu API (unofficial)
// Copyright (C) 2021  Snehit Sah

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key key,
    @required this.leadingIcon,
    @required this.label,
  }) : super(key: key);

  final IconData leadingIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          leadingIcon,
          color: Consts.shade,
        ),
        SizedBox(width: 8),
        Text(
          label,
          textAlign: TextAlign.left,
          style: Consts.categoryHeading,
        ),
      ],
    );
  }
}
