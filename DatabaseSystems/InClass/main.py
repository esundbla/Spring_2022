from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, Integer, create_engine, ForeignKey
from sqlalchemy.orm import sessionmaker, relationship

Base = declarative_base()

class Album(Base):

   # table mapping
   __tablename__ = 'albums'

   # column mapping
   id = Column(Integer, primary_key=True)
   title = Column(String)
   artist = Column(String)
   year = Column(Integer)
   tracks = relationship("Track", primaryjoin="Album.id==Track.id")

   def __str__(self):
      s = str(self.id) + ", " + self.title + ", " + self.artist + ", " + str(self.year) + ", ["
      for track in self.tracks:
         s += "{ " + str(track.num) + ", " + track.name + " }, "
      s = s[:-2] + ']'
      return s

class Track(Base):

   # table mapping
   __tablename__ = 'tracks'

   # column mapping
   id = Column(Integer, ForeignKey("albums.id"), primary_key=True)
   num = Column(Integer, primary_key=True)
   name = Column(String)

   def __str__(self):
      return str(self.id) + ", " + str(self.num) + ", " + self.name

# db connection and session creation
db_string = "postgresql://postgres:Einstein4@localhost:5432/music"
db = create_engine(db_string)
Session = sessionmaker(db)
session = Session()

# simple search
albums = session.query(Album)
for alb in albums:
   print(alb)
