'''
CS3810 - Principles of Database Systems - Spring 2022
Instructor: Thyago Mota
Student Names: Erik Sundblad
Description: creates and populates a file-based embedded database
'''

import sqlite3

# TODO: create and populate the database
if __name__ == "__main__":

    conn = sqlite3.connect('careers.db')
    with open('dataLoad.sql') as f:
        conn.executescript(f.read())
    conn.commit()
    conn.close
