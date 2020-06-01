import 'package:flutter/material.dart';

class HotMenu extends StatelessWidget {
  final List<Map<String, dynamic>> _data = [
    {
      'id': 0,
      'title': 'Category',
      'icon': Icons.format_list_bulleted,
      'color': Colors.orange
    },
    {
      'id': 1,
      'title': 'Coins &\nCoupons',
      'icon': Icons.trip_origin,
      'color': Colors.deepOrange
    },
    {
      'id': 2,
      'title': 'Freebies',
      'icon': Icons.card_giftcard,
      'color': Colors.teal
    },
    {
      'id': 3,
      'title': 'Flash Deals',
      'icon': Icons.trending_up,
      'color': Colors.red
    },
    {
      'id': 4,
      'title': 'Coupon Pals',
      'icon': Icons.monetization_on,
      'color': Colors.lime
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _data
                .map((data) => _HotMenuItem(
                      data['id'],
                      data['title'],
                      data['icon'],
                      data['color'],
                    ))
                .toList()),
      ),
    );
  }
}

class _HotMenuItem extends StatelessWidget {
  final int id;
  final String title;
  final IconData icon;
  final Color color;

  _HotMenuItem(this.id, this.title, this.icon, this.color);

  Widget get _item {
    return Column(
      children: <Widget>[
        CircleAvatar(
          child: Icon(
            icon,
          ),
          backgroundColor: color,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: TextStyle(fontSize: (id != 1) ? 12 : 10),
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          maxLines: 2,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return (id != 1)
        ? _item
        : Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: _item,
          );
  }
}
