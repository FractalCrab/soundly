
def insert():
    pass

def select(table,cursor):
    query="select * from "+ table
    cursor.execute(query)
    return cursor.fetchall()

def selectWhere(table,cursor,whereClause):
    query = "select * from " + table +" where "+whereClause
    cursor.execute(query)
    return cursor.fetchall()

