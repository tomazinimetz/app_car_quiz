import 'package:app/domain/quiz/quiz_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildStatelessWidget> all() => [
        ChangeNotifierProvider(
          create: (_) => QuizState(),
        ),
      ];
}
