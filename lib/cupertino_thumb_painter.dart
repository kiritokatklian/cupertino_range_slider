// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of 'cupertino_range_slider.dart';

const Color _kThumbBorderColor = Color(0x0A000000);

const List<BoxShadow> _kSliderBoxShadows = <BoxShadow>[
  BoxShadow(
    color: Color(0x26000000),
    offset: Offset(0, 3),
    blurRadius: 8.0,
  ),
  BoxShadow(
    color: Color(0x29000000),
    offset: Offset(0, 1),
    blurRadius: 1.0,
  ),
  BoxShadow(
    color: Color(0x1A000000),
    offset: Offset(0, 3),
    blurRadius: 1.0,
  ),
];

const double _kThumbRadius = 14.0;

/// Paints an iOS-style slider thumb
///
/// Used by [CupertinoSwitch] and [CupertinoSlider].
class _SliderThumbPainter {
  /// Creates an object that paints an iOS-style slider thumb.
  const _SliderThumbPainter({
    this.color = CupertinoColors.white,
    this.shadows = _kSliderBoxShadows,
    this.radius = _kThumbRadius,
  });

  /// The color of the interior of the thumb.
  final Color color;

  /// The list of [BoxShadow] to paint below the thumb.
  ///
  /// Must not be null.
  final List<BoxShadow> shadows;

  /// Half the default diameter of the thumb.
  final double radius;

  /// Paints the thumb onto the given canvas in the given rectangle.
  ///
  /// Consider using [radius] and [extension] when deciding how large a
  /// rectangle to use for the thumb.
  void paint(Canvas canvas, Rect rect) {
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(rect.shortestSide / 2.0),
    );

    for (final BoxShadow shadow in shadows) {
      canvas.drawRRect(rrect.shift(shadow.offset), shadow.toPaint());
    }

    canvas.drawRRect(
      rrect.inflate(0.5),
      Paint()..color = _kThumbBorderColor,
    );
    canvas.drawRRect(rrect, Paint()..color = color);
  }
}
