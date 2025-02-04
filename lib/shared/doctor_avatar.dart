import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cached_network_image/cached_network_image.dart';

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
        child: kIsWeb
            ? Image.network(
                avatarUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, size: size);
                },
              )
            : CachedNetworkImage(
                imageUrl: avatarUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Icon(Icons.person, size: size),
                errorWidget: (context, url, error) => Icon(Icons.person, size: size),
              ),
      ),
    );
  }
}
