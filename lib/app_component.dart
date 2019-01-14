import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:async';
import 'package:chartjs/chartjs.dart';
import 'dart:html';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    MaterialButtonComponent,
    MaterialProgressComponent,
    NgFor,
    NgIf,
    NgClass,
    NgModel,
    ViewChild,
    ViewChildren
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
    'Взаимодействующий', 'Теплый', 'Договаривающийся', 'Осведомленный', 'Приятный', 'Объединяющий'
  ];
// текстовые расшифровки результатов
  final List<String> text_result_P = [
    "Менеджер, P-функция которого находится на таком низком уровне, не понимает рынка и потребностей клиентов. Он также не знает технологий, которые могут эти потребности удовлетворить. Как следствие, результативность компании в краткосрочном аспекте находится под угрозой.",
    "Функция производства результатов развита ровно настолько, чтобы понимать, что нужно делать. Тем не менее, разработку продукта лучше делегировать ярко выраженному P-менеджеру, который знает рынок, потребности клиентов и технологии, способные их удовлетворить.",
    "Выполнение функции производства результатов находится на высоком уровне. Такой менеджер не просто понимает, что нужно делать. Он обладает достаточной целеустремленностью, чтобы воплотить идею в готовый продукт, который будет удовлетворять потребности клиентов."
  ];
  final List<String> text_result_A = [
    "Функция администрирования находится на низком уровне. Менеджер, который ею обладает, не может организовать процесс производства результатов. Он не обращает внимания на детали и не может систематизировать работу компании.",
    "Функция администрирования развита на приемлемом уровне. Такой менеджер сможет осуществлять контроль производства результатов в настоящий момент. Однако создание системы бесперебойного функционирования предприятия лучше поручить настоящему Администратору.",
    "Менеджер, выполняющий функцию администрирования на таком уровне, блестяще справляется с организацией рабочей среды, планированием, управлением и контролем ресурсов компании. Тем самым он подготавливает почву для производства результатов."
  ];
  final List<String> text_result_E = [
    "Менеджер, выполняющий функцию предпринимательства на столь низком уровне, не обладает пониманием, что нужно делать сегодня, чтобы быть успешным завтра. Он не может руководить организацией в реалиях постоянно изменяющегося мира.",
    "Функция предпринимательства sразвита на удовлетворительном уровне. Такой менеджер понимает важность стратегического планирования и действий, направленных на достижение долгосрочных целей. Тем не менее, разработку такого плана того, что делать сегодня, чтобы быть успешным завтра лучше поручить E-менеджеру.",
    "Функция предпринимательства находится на высоком уровне. Такой менеджер обладает аналитическим мышлением, которое позволяет ему анализировать изменения окружающей среды. Его креативность помогает создать такое видение компании, которое сделает её успешной в долгосрочной перспективе, но работать над его достижением он начинает сразу же."
  ];
  final List<String> text_result_I = [
    "Функция интеграции находится в зачаточном состоянии. Следовательно, формирование, сплочение и мотивацию команды лучше поручить I-менеджеру. Он сможет создать в компании систему ценностей и норм поведения, которые направят усилия ее сотрудников на достижение общей цели.",
    "Реализация I-функции находится на среднем уровне. Такой менеджер не справляется с ней в полной мере, поэтому ее следует делегировать ярко выраженному интегратору, который сможет организовать взаимодействие команды для достижения общей цели.",
    "Менеджер, выполняющий функцию интеграции на таком уровне, блестяще справляется с созданием в компании атмосферы взаимоуважения и взаимодействия. Он направляет свое креативное мышление, чтобы сплотить людей с самыми разными мотивами и интересами для достижения общей цели."
  ];

  List listSkillBlocks = List<SkillBlock>(); // объект содержит показатели блока скиллов

  final skillScore = [1, 2, 3, 4]; //задаем значения для оценок скилла

  int selected_P = 1; // объявляем начальные значения оценок скиллов
  int selected_A = 1;
  int selected_E = 1;
  int selected_I = 1;

  int get value_P => selected_P; // получаем значения выбранных оценок для каждого скилла
  int get value_A => selected_A;
  int get value_E => selected_E;
  int get value_I => selected_I;

  int counter = 0; // номер блока с вопросами
  int _total = 0; // сумма выбранных скиллов
  int _aviable_P = 4; // доступное количество выборов в группе
  int _aviable_A = 4; // доступное количество выборов в группе
  int _aviable_E = 4; // доступное количество выборов в группе
  int _aviable_I = 4; // доступное количество выборов в группе
  /** Метод для контроля общего результата 10 баллов */
  void onChange() {
    Future((){ // два дня разбирался - надо подождать отработки результата и тогда его только вычислять
      totalSkills();
      checkAviability();
    });
  }
/* Функция расчета суммы выборов */
  void totalSkills(){
  //  print("P "+value_P.toString());
  //  print("A "+value_A.toString());
  //  print("E "+value_E.toString());
  //  print("I "+value_I.toString());
    if(value_A!=null && value_E!=null && value_I!=null && value_P!=null){
    _total = value_P + value_A + value_E + value_I;
  //  print("сумма оценок = "+_total.toString());
    }
  }

  int get total => _total;

  /* Проверка доступности количества выборов */

  void checkAviability() {
    _aviable_P = 11 - _total;
    _aviable_A = 11 - _total;
    _aviable_E = 11 - _total;
    _aviable_I = 11 - _total;
  }

  int get aviable_P => _aviable_P;
  int get aviable_A => _aviable_A;
  int get aviable_E => _aviable_E;
  int get aviable_I => _aviable_I;

/* нажатие кнопки перехода к другому блоку вопросов */
  increment() {
    if(counter<11){
  //создаем объект с результатами оценок одного блока (предыдущий блок)
    SkillBlock block = SkillBlock(counter, value_P, value_A, value_E, value_I);
    listSkillBlocks.add(block); // пишем оценки блока в массив

    counter++;
//    print("номер блока "+(counter+1).toString());
    uncheckAll(); //снимаем выборы со всех радио
    }
  }
  // геттеры названий скиллов
  String get skill_P => list_P[counter];
  String get skill_A => list_A[counter];
  String get skill_E => list_E[counter];
  String get skill_I => list_I[counter];

  @ViewChildren(MaterialRadioGroupComponent)
  List<MaterialRadioGroupComponent> groups;
  List<MaterialRadioComponent> radios;


  void uncheckAll() {
    
    for(MaterialRadioGroupComponent child in groups){
    //  print(child.selected);
      child.selected = 1; // при переходе к другому блоку преселект первых оценок
    }
    }

    int get count => counter;

    // выбор класса видимость или невидимость для страницы с результатом
    bool _trigger = false;
/** В этом коде получаем результат теста и меняем видимость страницы результата */
    void viewResult() {
      _trigger = true;
      SkillBlock block = SkillBlock(counter, value_P, value_A, value_E, value_I);
    listSkillBlocks.add(block); // пишем оценки блока в массив

      _getResult();
    }

    bool get trigger => _trigger; // триггер видимости блока для html

    int result_P=0;
    int result_A=0;
    int result_E=0;
    int result_I=0;

// функция для вызова кнопкой "Узнать результат"
    void _getResult() {
      result_P = getSumm_P();
      result_A = getSumm_A();
      result_E = getSumm_E();
      result_I = getSumm_I();
/* Рисуем график */
var titles =["P", "A", "E", "I"];
var chartdata = [result_P, result_A, result_E, result_I];
var data = LinearChartData(
  labels: titles,
  datasets: <ChartDataSets>[ChartDataSets(
    label: "Сумма баллов", 
    data: chartdata,
    backgroundColor: "rgba(0, 142, 179, 1)"
    )]
);
  var config = new ChartConfiguration(
      type: 'bar', data: data, options: new ChartOptions(
        scales: ChartScales(
          yAxes: [
              
          ]
        ),
        responsive: true));

  new Chart(querySelector('#canvas') as CanvasElement, config);

    }
// геттеры для html
  int get P => result_P;
  int get A => result_A;
  int get E => result_E;
  int get I => result_I;
// сумматоры показателей для вычисления результата
  getSumm_P () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_P;} return summ;}
  getSumm_A () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_A;} return summ;}
  getSumm_E () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_E;} return summ;}
  getSumm_I () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_I;} return summ;}

  }
// для записи результатов оценок каждого блока
  class SkillBlock {
    int id;
    int value_P;
    int value_A;
    int value_E;
    int value_I;
    SkillBlock(this.id, this.value_P, this.value_A, this.value_E, this.value_I);
  }