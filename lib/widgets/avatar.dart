import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const placeholder = 'assets/icons/avatar.jpg';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final int radius;
  final bool isAllReelViewed;
  final bool isLoading;

  const Avatar({
    required this.imageUrl,
    this.radius = 40,
    this.isAllReelViewed = false,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    final diameter = radius * 2;

    Widget avatar = CircleAvatar(
      radius: radius.toDouble(),
      child: imageUrl == null
          ? _placeholder(diameter)
          : CachedNetworkImage(
              imageUrl: imageUrl,
              useOldImageOnUrlChange: true,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return _placeholder(diameter);
              },
              errorWidget: (BuildContext context, String url, dynamic error) {
                return _placeholder(diameter);
              },
            ),
    );

    return Container(
      // add border to below image if [isAllReelViewed] is true
      decoration: BoxDecoration(
        border: !isAllReelViewed ? Border.all(color: Colors.red.shade200, width: 3) : null,
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints.tightFor(width: diameter.toDouble(), height: diameter.toDouble()),
      padding: const EdgeInsets.all(4),
      child: ClipOval(
        child: isLoading
            ? Shimmer(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade100,
                    Colors.grey.shade300,
                  ],
                ),
                enabled: true,
                child: avatar,
              )
            : avatar,
      ),
    );
  }

  Widget _placeholder(int diameter) {
    return Image.asset(
      placeholder,
      fit: BoxFit.cover,
      height: diameter.toDouble(),
      width: diameter.toDouble(),
    );
  }
}
