import 'package:flutter/material.dart';

class SemanticSpacer extends StatelessWidget {
  const SemanticSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32);
  }
}

class HeaderSpacer extends StatelessWidget {
  const HeaderSpacer({Key key}) : super(key: key);

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
      height: 8,
    );
  }
}
