from main import connectar

def cadastrar_cliente():
    conn = connectar()
    cursor = conn.cursor()

    
    nome = input('Nome: ')
    email = input('Email: ')
    telefone = input('Telefone: ')
    data = input('Data de cadastro (AAAA-MM-DD): ')
    cpf = input('CPF: ')


    sql = '''
    INSERT INTO tb_cliente
    (nome, email, telefone, data_cadastro, cpf)
    VALUES (%s,%s,%s,%s,%s)
    '''

    valores = (nome, email, telefone, data, cpf)

    cursor.execute(sql, valores)

    conn.commit()

    print('Cliente cadastrado!')

    cursor.close()
    conn.close()