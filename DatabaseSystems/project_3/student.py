'''
CS3810 - Principles of Database Systems - Spring 2022
Instructor: Thyago Mota
Student Names: Erik Sundblad
Description: creates a Student entity with a 1-many mapping to StudentInterest and allows listing of all students
'''


from sqlalchemy.ext.declarative import declarative_base  
from sqlalchemy import Column, String, Integer, create_engine, ForeignKey
from sqlalchemy.orm import sessionmaker, relationship

Base = declarative_base()

# TODO: finish the object-relational mapping
class Student(Base):
    __tablename__ = 'Students'

    email = Column(String, primary_key=True)
    name = Column(String)
    major = Column(String)
    graduation = Column(String)
    interests = relationship("StudentInterest", primaryjoin='Student.email==StudentInterest.email')

    def __str__(self):
        s = self.email + ', ' + self.name + ', ' + self.major + ', Graduates:' + self.graduation + ' |Interests: [ '
        for i in self.interests:
            s += str(i) + ', '
        s += '\b\b]'
        return s


# TODO: finish the object-relational mapping
class StudentInterest(Base):
    __tablename__ = 'StudentInterests'

    email = Column(String, ForeignKey('Students.email'), primary_key=True)
    abr = Column(String, ForeignKey('Interests.abr'), primary_key=True)

    def __str__(self):
        s = self.abr
        return s


if __name__ == "__main__":

    # db connection and session creation
    db_string = "sqlite:///careers.db"
    db = create_engine(db_string)  
    Session = sessionmaker(db)  
    session = Session()

    # TODO: list all students
    stu = session.query(Student)
    for s in stu:
        print(s)
    