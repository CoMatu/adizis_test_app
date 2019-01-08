import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: "radio-form",
  styleUrls: ['test_form_component.css'],
  templateUrl: 'radio_component.html',
  directives: [
    NgModel,
    NgFor,
    NgIf,
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    ContentChildren,
    ViewChild,
    ViewChildren
    ]
)

class RadioScreenComponent {

  final scillScore = [1, 2, 3, 4]; //задаем значения для оценок скилла
  int selected_P = 0; // объявляем начальные значения оценок скиллов
  int selected_A = 0;
  int selected_E = 0;
  int selected_I = 0;

  int get value_P => selected_P; // получаем значения выбранных оценок для каждого скилла
  int get value_A => selected_A;
  int get value_E => selected_E;
  int get value_I => selected_I;

  String get result => (value_P+value_A+value_E+value_I).toString(); // выводим сумму оценок

  @ViewChildren(MaterialRadioGroupComponent) 
  List<MaterialRadioGroupComponent> radioGroup;

  void uncheckedGroup() {
    for(var group in radioGroup){
      print(group.selected);
    }
  }

  @Input()
  String title_P;
  @Input()
  String title_A;
  @Input()
  String title_E;
  @Input()
  String title_I;

}