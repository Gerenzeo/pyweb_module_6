from datetime import datetime, timedelta
from faker import Faker
import sqlite3
from random import randint

COUNT_TEACHERS = 5
COUNT_STUDENTS = 50
COUNT_DISCIPLINES = 8
COUNT_GROUPS = 3


fake = Faker('uk-UA')

connection = sqlite3.connect('data.db')
cursor = connection.cursor()


def seed_students():
    sql = 'INSERT INTO students (first_name, last_name, group_id) VALUES (?, ?, ?)'
    
    for _ in range(10):
        cursor.execute(sql, (fake.first_name(), fake.last_name(), randint(1, COUNT_GROUPS)))
    
    connection.commit()

def seed_teachers():
    sql = 'INSERT INTO teachers (first_name, last_name) VALUES (?, ?)'
    [cursor.execute(sql, (fake.first_name(), fake.last_name())) for _ in range(1, COUNT_TEACHERS+1)]
    connection.commit()

def seed_groups():
    groups = ['R-33', 'RA_66', 'IR-99']
    sql = 'INSERT INTO [groups] (name) VALUES (?)'
    cursor.executemany(sql, zip(groups,))
    connection.commit()

def seed_disciplines():
    disciplines = ['history', 'geography', 'mathematics', 'Informatics', 'english', 'geometry', 'information technology', 'design']
    sql = 'INSERT INTO disciplines (name, teacher_id) VALUES (?, ?)'
    
    for discipline in disciplines:
        cursor.execute(sql, (discipline, randint(1, COUNT_TEACHERS)))
    
    connection.commit()

def seed_grades():
    sql = 'INSERT INTO grades (discipline_id, student_id, grade, date_of) VALUES (?, ?, ?, ?)'

    for student in range(1, COUNT_STUDENTS + 1):
        for discipline_id in range(1, COUNT_DISCIPLINES + 1):
            random_grade = randint(1, 5)
            day = datetime.strptime('01-07-2023', '%d-%m-%Y').date() - timedelta(randint(1, 365))
            cursor.execute(sql, (discipline_id, student, random_grade, day))
   
    connection.commit()

if __name__ == "__main__":
    # try:
    #     seed_groups()
    #     seed_disciplines()
    #     seed_teachers()
    #     seed_students()
    #     seed_grades()
    # except sqlite3.DatabaseError as error:
    #     print(error)
    #     connection.rollback()
    # finally:
    #     connection.close()
    pass
