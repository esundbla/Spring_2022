'''
CS3810 - Principles of Database Systems - Spring 2022
Instructor: Thyago Mota
Student Names: Erik Sundblad
Description: creates an Employer entity with a 1-many mapping to EmployerInterest and allows listing of all employers
'''


from sqlalchemy.ext.declarative import declarative_base  
from sqlalchemy import Column, String, Integer, Boolean, create_engine, ForeignKey
from sqlalchemy.orm import sessionmaker, relationship

Base = declarative_base()

# TODO: finish the object-relational mapping
class Employer(Base):
    __tablename__ = 'Employers'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    size = Column(Integer)
    location = Column(String)
    forprofit = Column(Boolean)
    govern = Column(Boolean)
    interests = relationship("EmployerInterest", primaryjoin="Employer.id==EmployerInterest.id")

    def __str__(self):
        s = str(self.id) + ', ' + self.name + ', ' + str(self.size) + ', ' + self.location + ', for Profit: '\
            + str(self.forprofit) + ' Goverment: ' + str(self.govern) + ' |Interests: [ '
        for i in self.interests:
            s += str(i) + ', '
        s += '\b\b]'
        return s

# TODO: finish the object-relational mapping
class EmployerInterest(Base):
    __tablename__ = 'EmployersInterests'

    id = Column(Integer, ForeignKey('Employers.id'), primary_key=True)
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

    # TODO: list all employers
    emp = session.query(Employer)
    for e in emp:
        print(e)
    