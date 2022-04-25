'''
CS3810 - Principles of Database Systems - Spring 2022
Instructor: Thyago Mota
Student Names: Erik Sundblad
Description: Create many to many relationships and demonstrated though modified to string methods
'''
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, Integer, Boolean, create_engine, ForeignKey, Table
from sqlalchemy.orm import sessionmaker, relationship


Base = declarative_base()
metadata = Base.metadata


StudentInterest = Table('StudentInterests', metadata,
    Column('email', ForeignKey('Students.email'), primary_key=True),
    Column('abr', ForeignKey('Interests.abr'), primary_key=True))


EmployerInterest = Table('EmployersInterests', metadata,
    Column('id', ForeignKey('Employers.id'), primary_key=True),
    Column('abr', ForeignKey('Interests.abr'), primary_key=True))


class Interest(Base):
    __tablename__ = 'Interests'

    abr = Column(String, primary_key=True)
    descr = Column(String)


    def __str__(self):
        s = self.abr + "\nStudents: ["
        for student in self.Students:
            s += str(student) + ', '
        s += '\b\b] \nEmployers: ['
        for employer in self.Employers:
            s += str(employer) + ', '
        s += '\b\b]'

        return s



class Employer(Base):
    __tablename__ = 'Employers'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    size = Column(Integer)
    location = Column(String)
    forprofit = Column(Boolean)
    govern = Column(Boolean)
    interests = relationship("Interest", secondary=EmployerInterest, backref='Employers')

    def __str__(self):
        s = self.name
        return s


class Student(Base):
    __tablename__ = 'Students'

    email = Column(String, primary_key=True)
    name = Column(String)
    major = Column(String)
    graduation = Column(String)
    interests = relationship("Interest", secondary=StudentInterest, backref='Students')

    def __str__(self):
        s = self.name
        return s


if __name__ == "__main__":
    # db connection and session creation
    db_string = "sqlite:///careers.db"
    db = create_engine(db_string)
    Session = sessionmaker(db)
    session = Session()

    stu = session.query(Interest)
    for s in stu:
        print(s)
