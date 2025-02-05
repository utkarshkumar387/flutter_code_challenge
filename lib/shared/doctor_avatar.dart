import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
        backgroundColor: Colors.grey[200],
        backgroundImage: kIsWeb ? null : CachedNetworkImageProvider(avatarUrl),
        child: kIsWeb
            ? ClipOval(
                child: Image.network(
                  avatarUrl,
                  width: size * 2,
                  height: size * 2,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    size: size,
                    color: Colors.grey,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
