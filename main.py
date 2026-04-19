class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def display_info(self):
        print(f"Name: {self.name}, Age: {self.age}")


class Student(Person):
    def __init__(self, name, age, student_id):
        super().__init__(name, age)
        self.student_id = student_id

    def display_info(self):
        super().display_info()
        print(f"Student ID: {self.student_id}")


class Teacher(Person):
    def __init__(self, name, age, teacher_id):
        super().__init__(name, age)
        self.teacher_id = teacher_id

    def display_info(self):
        super().display_info()
        print(f"Teacher ID: {self.teacher_id}")


class UniversityTeacher(Teacher):
    def __init__(self, name, age, teacher_id, university_name):
        super().__init__(name, age, teacher_id)
        self.university_name = university_name

    def display_info(self):
        super().display_info()
        print(f"University Name: {self.university_name}")


class UniversityStudent(Student):
    def __init__(self, name, age, student_id, university_name):
        super().__init__(name, age, student_id)
        self.university_name = university_name

    def display_info(self):
        super().display_info()
        print(f"University Name: {self.university_name}")


class University:
    def __init__(self, name):
        self.name = name
        self.teachers = []
        self.students = []

    def add_teacher(self, teacher):
        self.teachers.append(teacher)

    def add_student(self, student):
        self.students.append(student)

    def display_info(self):
        print(f"University Name: {self.name}")
        print("Teachers:")
        for teacher in self.teachers:
            teacher.display_info()
            print()
        print("Students:")
        for student in self.students:
            student.display_info()
            print()


university = University("Harvard")
university.add_teacher(UniversityTeacher("John Doe", 40, "T001", "Harvard"))
university.add_student(UniversityStudent("Jane Doe", 20, "S001", "Harvard"))
university.display_info()