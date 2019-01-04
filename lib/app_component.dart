import 'package:angular/angular.dart';

import 'src/test_forms/test_form_component.dart';
import 'src/test_forms/radio_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TestFormComponent, RadioComponent],
)
class AppComponent {
  // Nothing here yet. All logic is in TestFormComponent.
}
