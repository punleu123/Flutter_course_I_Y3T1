// ignore_for_file: public_member_api_docs, sort_constructors_first

enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() =>
      'Address(street: $_street, city: $_city, zipCode: $_zipCode)';
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : this(
        name,
        baseSalary,
        [Skill.FLUTTER, Skill.DART],
        address,
        yearsOfExperience,
      );

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double totalSalary = _baseSalary;
    totalSalary += _yearsOfExperience * 2000;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;
        case Skill.DART:
          totalSalary += 3000;
          break;
        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }

  @override
  String toString() {
    String skillString = _skills
        .map((skill) => skill.toString().split('.').last)
        .join(', ');
    return 'Employee: $_name\n'
        'Base Salary: \$_${_baseSalary.toStringAsFixed(2)}\n'
        'Computed Salary: \$_${computeSalary().toStringAsFixed(2)}\n'
        'Skills: $skillString\n'
        'Address: $_address\n'
        'Years of Experience: $_yearsOfExperience';
  }
}

List<Employee> employees = [];

void addEmployee(Employee employee) {
  employees.add(employee);
}

void removeEmployee(Employee employee) {
  employees.remove(employee);
}

void listEmployees() {
  for (var employee in employees) {
    print('------------------------');
    print(employee);
  }
}

void main() {
  var address1 = Address('123 Street', 'Phnom Penh', '12000');
  var dev1 = Employee.mobileDeveloper('Prince', 10000, address1, 3);

  var address2 = Address('6A Road', 'Siem Reap', '13000');
  var dev2 = Employee('Punleu', 9000, [Skill.OTHER], address2, 2);

  addEmployee(dev1);
  addEmployee(dev2);

  listEmployees();
}
