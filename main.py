class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def info(self):
        return f"Name: {self.name}, Age: {self.age}"

class Employee(Person):
    def __init__(self, name, age, salary):
        super().__init__(name, age)
        self.salary = salary

    def info(self):
        return f"{super().info()}, Salary: {self.salary}"

class Teacher(Employee):
    def __init__(self, name, age, salary, subject):
        super().__init__(name, age, salary)
        self.subject = subject

    def info(self):
        return f"{super().info()}, Subject: {self.subject}"

class Student(Person):
    def __init__(self, name, age, grade):
        super().__init__(name, age)
        self.grade = grade

    def info(self):
        return f"{super().info()}, Grade: {self.grade}"

class University:
    def __init__(self):
        self.teachers = []
        self.students = []

    def add_teacher(self, teacher):
        self.teachers.append(teacher)

    def add_student(self, student):
        self.students.append(student)

    def info(self):
        teachers_info = "\n".join(teacher.info() for teacher in self.teachers)
        students_info = "\n".join(student.info() for student in self.students)
        return f"Teachers:\n{teachers_info}\n\nStudents:\n{students_info}"

university = University()
university.add_teacher(Teacher("John Doe", 35, 5000, "Math"))
university.add_teacher(Teacher("Jane Doe", 30, 4500, "Science"))
university.add_student(Student("Bob Smith", 20, 90))
university.add_student(Student("Alice Johnson", 22, 85))
print(university.info())