from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, Integer, Float, create_engine
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class Program(Base):

    # table mapping
    __tablename__ = 'programs'

    # TODO: finish the column mapping (3 points)
    name = Column(String, primary_key=True)
    descr = Column(String)
    price = Column(Float)

    # TODO: finish the __str__ method override (3 points)
    def __str__(self):
        s = 'Name: ' + str(self.name) + " \nDescription: " + str(self.descr) + "\nPrice: " + str(self.price) + '\n' + '-'*50
        return s

# db connection and session creation
db_string = "postgresql://postgres:Einstein4@localhost:5432/camp"
db = create_engine(db_string)
Session = sessionmaker(db)
session = Session()


# simple search
programs = session.query(Program)
for program in programs:
    print(program)