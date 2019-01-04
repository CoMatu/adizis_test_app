import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: "radio-form",
  template: "<h2>Добро пожаловать {{name}}</h2>"
)

class RadioComponent {
  String name = 'Evgeny';
}