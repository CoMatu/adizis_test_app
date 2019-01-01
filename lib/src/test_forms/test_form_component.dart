//import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'test-forms',
  styleUrls: ['test_form_component.css'],
  templateUrl: 'test_form_component.html',
  directives: [
    MaterialRadioGroupComponent,
    MaterialRadioComponent,
    NgModel
      ],
//  providers: [ClassProvider(TodoListService)],
)

class TestFormComponent {
  
}