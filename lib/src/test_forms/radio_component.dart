import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: "radio-form",
  styleUrls: ['test_form_component.css'],
  templateUrl: 'radio_component.html',
  directives: [
    NgFor,
    MaterialRadioComponent,
    MaterialRadioGroupComponent
    ]
)

class RadioScreenComponent {
  final scillScore = [1, 2, 3, 4];

  @Input()
  String title_P;
  @Input()
  String title_A;
  @Input()
  String title_E;
  @Input()
  String title_I;
}