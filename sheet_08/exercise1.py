import psycopg2
from psycopg2 import sql
from datetime import datetime

def get_max_widths(headers, res):
    ret = [0] * len(headers)
    for i, h in enumerate(headers):
        ret[i] = len(str(h))
    
    for row in res:
        for i, e in enumerate(row):
            if len(str(e)) > ret[i]:
                ret[i] = len(str(e))

    return ret

def total_width(widths):
    return sum(widths) + len(widths) * 3 - 1 # for the ' | '

def print_result(headers, res: list[tuple]):
    colwidths = get_max_widths(headers, res)

    for i, h in enumerate(headers):
        print ("{0:<{1}}".format(h, colwidths[i]), end='')
        if i < len(headers):
            print(' | ', end='')
    
    print()
    print('-'*total_width(colwidths))

    for row in res:
        for i, e in enumerate(row):
            if isinstance(e, str):
                print ("{0:<{1}}".format(e, colwidths[i]), end='')
            else:
                print ("{0:>{1}}".format(str(e), colwidths[i]), end='')
            if i < len(row):
                print(' | ', end='')
        print()

    print('\n(', len(res), ' rows)', sep='')

def execute_query(query_string):
    res = None
    try:
        connection = psycopg2.connect(user="postgres",
                                    password="SuperSecret",
                                    host="127.0.0.1",
                                    port="5432",
                                    database="ps_db_sheet05")
        cursor = connection.cursor()
        cursor.execute(query_string)
        colnames = [desc[0] for desc in cursor.description]
        res = cursor.fetchall()

        if connection:
            cursor.close()
            connection.close()

        return [colnames, res]
    except (Exception, psycopg2.Error) as error:
        print("Error while executing PostgreSQL query", error)
    finally:
        if connection:
            cursor.close()
            connection.close()


def validate(date_text):
    try:
        if date_text != datetime.strptime(date_text, "%Y-%m-%d").strftime('%Y-%m-%d'):
            raise ValueError
        return True
    except ValueError:
        print('Dates must be formated like this: yyyy-mm-dd')
        return False


def get_rental_report():
    from_date = input('From (2005-06-01): ')
    if not validate(from_date):
        return
    to_date = input('To (2005-06-30): ')
    if not validate(to_date):
        return

    query_str = """
        SELECT
            c.name AS "category_name",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 1) AS "mon",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 2) AS "tue",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 3) AS "wed",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 4) AS "thu",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 5) AS "fri",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 6) AS "sat",
            COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 0) AS "sun",
            COUNT(*) total
        FROM rental AS r
        JOIN  inventory as i ON i.inventory_id=r.inventory_id
        JOIN  film_category AS fc ON fc.film_id = i.film_id
        JOIN  category AS c ON c.category_id = fc.category_id
        WHERE
            r.rental_date >= '{0}' and
            r.rental_date <= '{1}'
        GROUP BY c.name
        ORDER BY c.name ASC
        """

    res = execute_query(query_str.format(from_date, to_date))
    if res:
        print_result(res[0], res[1])

def get_rental_report_function():
    from_date = input('From (2005-06-01): ')
    if not validate(from_date):
        return
    to_date = input('To (2005-06-30): ')
    if not validate(to_date):
        return

    query_str = "SELECT * FROM rental_report_function('{0}', '{1}');"
    res = execute_query(query_str.format(from_date, to_date))
    if res:
        print_result(res[0], res[1])

while True:
    print('sql > ', end='')
    command = input()
    if command == 'q':
        break
    elif command == 'rental_report':
        get_rental_report()
    elif command == 'rental_report_function':
        get_rental_report_function()
    elif command != '':
        res = execute_query(command)
        if res:
            print_result(res[0], res[1])