"""
Data organization and PSQL database Insertion program
Erik Sundblad
3/27/2022
"""

import psycopg2
import csv


def getParams():
    """ Logins stored in secure text file """
    f = open("logins.txt")
    log = f.readline().split(',')
    if log[0] == 'admin':
        params = {
            'host': 'localhost',
            'port': 5432,
            'dbname': 'cms',
            'user': log[1],
            'password': log[2]}
        return params


if __name__ == "__main__":
    """ Main body gets necisarry params opens db connection and filters in necessary Insertions"""
    params = getParams()
    conn = psycopg2.connect(**params)
    if conn:
        print('Connection to Postgres database ' + params['dbname'] + ' was successful!')
        curs = conn.cursor()
        with open('MUP_IHP_RY21_P02_V10_DY19_PrvSvc_0.csv', newline='') as csvfile:
            cms_file = csv.reader(csvfile, delimiter=',', quotechar='"')
            next(cms_file)
            for row in cms_file:
        # columns we will be parsing out
        # CRN0, name1, street2, city3, state4, fips5, zip6, ruca7, rucaDesc8, diag9, diagDesc10, tot11, avgcov12, avgTot13, avgMedc14
                prov_data = (row[0], row[1], row[2], row[3])
                provider = """INSERT INTO Provider (Rndrng_CCN, Rndrng_Prvdr_Org_Name, Rndrng_Prvdr_St, Rndrng_Prvdr_City)
                           VALUES (%s,%s,%s,%s) ON CONFLICT (Rndrng_CCN) DO NOTHING;"""
                curs.execute(provider, prov_data)
                conn.commit()

                prov_state_data = (row[0], row[4], row[5])
                provider_state = """INSERT INTO ProviderState (Rndrng_CCN, Rndrng_Prvdr_State_abrvtn, Rndrng_Prvdr_State_FIPS)
                                           VALUES (%s,%s,%s) ON CONFLICT (Rndrng_CCN) DO NOTHING;"""
                curs.execute(provider_state, prov_state_data)
                conn.commit()

                ruca_data = (row[7], row[8])
                ruca = """INSERT INTO RUCA (Rndrng_Prvdr_RUCA, Rndrng_Prvdr_RUCA_Desc)
                                           VALUES (%s,%s) ON CONFLICT (Rndrng_Prvdr_RUCA) DO NOTHING;"""
                curs.execute(ruca, ruca_data)
                conn.commit()

                prov_zip_data = (row[0], row[6], row[7])
                prov_zip = """INSERT INTO ProviderZip (Rndrng_CCN, Rndrng_zip5, Rndrng_Prvdr_RUCA)
                                                   VALUES (%s,%s,%s) ON CONFLICT DO NOTHING;"""
                curs.execute(prov_zip, prov_zip_data)
                conn.commit()

                diag_data = (row[9], row[10])
                diag = """INSERT INTO Diagnosis (DRG_Cd, DRG_Desc)
                                                   VALUES (%s,%s) ON CONFLICT DO NOTHING;"""
                curs.execute(diag, diag_data)
                conn.commit()

                prov_diag_data = (row[0], row[9])
                prov_diag = """INSERT INTO ProviderDiagnosis (Rndrng_CCN, DRG_Cd)
                                                   VALUES (%s,%s) ON CONFLICT DO NOTHING;"""
                curs.execute(prov_diag, prov_diag_data)
                conn.commit()

                diag_stats_data = (row[9], row[11], row[12], row[13], row[14])
                diag_stats = """INSERT INTO DiagnosisStats (DRG_Cd, Tot_Dschrgs, Avg_Submtd_Cvrd_Chrg, Avg_Tot_Pymt_Amt, Avg_Mdcr_pymt_Amt)
                VALUES (%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING;"""
                curs.execute(diag_stats, diag_stats_data)
                conn.commit()

    else:
        print('Connection to Database Failed')
        exit(0)


    print('Bye!')
    conn.close()


