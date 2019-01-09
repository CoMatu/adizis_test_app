import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    MaterialButtonComponent,
    NgFor,
    NgIf,
    NgModel,
    ViewChild,
    ViewChildren,
    ContentChildren
    ],
  providers: [materialProviders]
)
class AppComponent {
  final List<String> list_P = [
    'Вовлеченный', 'Прямолинейный', 'Делающий', 'Отдающий себе отчет', 'Результативный', 
    'Упорный', 'Активный', 'Прагматичный', 'Побеждающий', 'Рациональный', 'Деловой', 'Реалистичный'
  ];
  final List<String> list_A = [
    'Сомневающийся', 'Анализирующий', 'Созерцающий', 'Оценивающий', 'Логичный', 'Консервативный', 
    'Наблюдающий', 'Размышляющий', 'Точный', 'Сдержанный', 'Аккуратный', 'Осторожный'
  ];
  final List<String> list_E = [
    'Яркий', 'Харизматичный', 'Провоцирующий', 'Идущий на риск', 'Задающий вопросы', 'Радикальный', 
    'Абстрактный', 'Смотрящий в будущее', 'Концептуальный', 'Генерирующий идеи', 'Творческий', 'Мечтающий'
  ];
  final List<String> list_I = [
    'Отзывчивый', 'Чувствующий', 'Сопереживающий', 'Благожелательный', 'Интуитивный', 'Общительный', 
    'Взаимодействующий', 'Теплый', 'Стремящийся к консенсусу', 'Осведомленный', 'Приятный', 'Объединяющий'
  ];

  int counter=0;

  increment() {
    if(counter<11){
    counter++;
    uncheckAll();
    }
  }

  decrement() {
    if(counter!=0){
      counter--;
    }
  }

  String get skill_P => list_P[counter];
  String get skill_A => list_A[counter];
  String get skill_E => list_E[counter];
  String get skill_I => list_I[counter];

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
  List<MaterialRadioGroupComponent> groups;

  void uncheckAll() {
    for(MaterialRadioGroupComponent child in groups){
      print(child.selected);
      child.selected = null;
    }
    }
  }