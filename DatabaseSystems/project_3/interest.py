'''
CS3810 - Principles of Database Systems - Spring 2022
Instructor: Thyago Mota
Student Names: Erik Sundblad
Description: creates Interest entity and allows listing of all interests
'''

from sqlalchemy.ext.declarative import declarative_base  
from sqlalchemy import Column, String, Integer, create_engine
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

# TODO: finish the object-relational mapping
class Interest(Base):
    __tablename__ = 'Interests'

    abr = Column(String, primary_key=True)
    descr = Column(String)


    def __str__(self):
        s = self.abr + ": " + self.descr
        return s


if __name__ == "__main__":

    # db connection and session creation
    db_string = "sqlite:///careers.db"
    db = create_engine(db_string)  
    Session = sessionmaker(db)  
    session = Session()


    # TODO: list all interests
    interests = session.query(Interest)
    for intr in interests:
        print(intr)

    