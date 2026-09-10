from main import connectar

def cadastrar_jogo():
    conn = connectar()
    cursor = conn.cursor()

    titulo = input('Título: ')
    genero = input('Gênero: ')
    preco = float(input('Preço: '))
    classificacao = input('Classificação: ')
    desenvolvedora = input('Desenvolvedora: ')
    lancamento = input('Data de lançamneto (AAAA-MM-DD): ')

    sql = '''
    INSERT INTO tb_jogo
    (titulo, genero, preco, 
    clas_ind, desenvolvedora,
    data_lanc)
    VALUES (%s,%s,%s,%s,%s,%s)
    '''

    valores = (
        titulo,
        genero,
        preco,
        classificacao,
        desenvolvedora,
        lancamento
    )

    cursor.execute(sql, valores)

    conn.commit()

    print('Jogo cadastrado!')

    cursor.close()
    conn.close()