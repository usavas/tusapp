import 'package:flutter/material.dart';

class SectionSpacer extends StatelessWidget {
  const SectionSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32);
  }
}

class WiderSpacer extends StatelessWidget {
  const WiderSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}

class SimpleSpacer extends StatelessWidget {
  const SimpleSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
    );
  }
}

class EndOfScreenSpacer extends StatelessWidget {
  const EndOfScreenSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
    );
  }
}
