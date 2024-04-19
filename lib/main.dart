import 'package:traqa/core/core.dart';

void main() async {
  await Setup.run();
  runApp(
    const TraqaApp(),
  );
}
