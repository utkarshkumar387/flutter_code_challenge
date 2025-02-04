import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DoctorAvatar extends StatelessWidget {
  final String avatarUrl;
  final double size;

  const DoctorAvatar({
    super.key,
    required this.avatarUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: size,
        backgroundImage: CachedNetworkImageProvider(avatarUrl),
      ),
    );
  }
}
