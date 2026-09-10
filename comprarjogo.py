from main import connectar 
from listarjogos import listar_jogos

def comprar_jogo():

    conn = connectar()
    cursor = conn.cursor()

    id_cliente = int(input('ID do cliente: '))

    carrinho = []
    valor_total = 0

    while True:

        listar_jogos()

        id_jogo = int(input('ID do jogo (0 para finalizar)'))

        if id_jogo == 0:
            break

        cursor.execute(
            'SELECT preco FROM tb_jogo WHERE id_jogo = %s',  
        (id_jogo,)
        )        

        resultado = cursor.fetchone()

        if resultado:
            preco = resultado[0]

            carrinho.append((id_jogo, preco))

            valor_total += preco

            print('Jogo adicionado ao carrinho!')

        else:
            print('Jogo não encontrado.')

    if len(carrinho) == 0:
        print('Nenhum jogo selecionado.')

        cursor.close()
        conn.close()

        return
    
    print('\nFormas de pagamento:')
    print('1 - Pix')
    print('2 - Crédito')
    print('3 - Débito')

    id_pagamento = int(input('Escolha: '))

    parcelas = 1

    if id_pagamento == 2:
        parcelas = int(input('Números de parcelas: '))

    cursor.execute(
        '''
        INSERT INTO tb_venda
        (id_cliente, data_venda, valor_total)
        VALUES (%s, CURDATE(), %s)
        ''',
        (id_cliente, valor_total)
    )

    conn.commit()

    id_venda = cursor.lastrowid

    for jogo in carrinho:

        id_jogo = jogo[0]
        preco = jogo[1]

        sql = '''
        INSERT INTO tb_item_venda
        (id_venda, id_jogo, quantidade, preco_unit)
        VALUES (%s, %s, %s, %s)
        '''

        valores = (id_venda, id_jogo, 1, preco)

        cursor.execute(sql, valores)
    
    cursor.execute(
        '''
        INSERT INTO tb_pagamento
        (id_venda, id_pagamento,
        numero_parcelas,
        valor_pago,
        status_pag)
        VALUES (%s, %s, %s, %s, %s)
        ''',
        (
            id_venda,
            id_pagamento,
            parcelas,
            valor_total,
            'Pago'
        )
    )

    conn.commit()

    print('\nCompra realizada com sucesso!')
    print(f'ID da venda: {id_venda}')
    print(f'Valor total: R${valor_total:.2f}')

    cursor.close()
    conn.close()