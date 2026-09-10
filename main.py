import mysql.connector

def connectar():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='31020714aS',
        database='GameVault'
    )