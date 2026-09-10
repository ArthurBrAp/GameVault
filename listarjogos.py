from main import connectar

def listar_jogos():
    conn = connectar()
    cursor = conn.cursor()
    

    cursor.execute('SELECT * FROM tb_jogo')


    jogos = cursor.fetchall()

    largura = 100

    print('\n' + '=' * largura)
    print('LISTA DE JOGOS'.center(largura))
    print('=' * largura)

    print(
    f'{"ID":<4}'
    f'{"Título":<25}'
    f'{"Preço":<10}'
    f'{"Dev.":<20}'
)
    
    print('-' * largura)

    for jogo in jogos:
        id_jogo = jogo[0]
        titulo = jogo[1][:38]
        preco = f'R${jogo[3]}'
        desenvolvedora = jogo[5][:38]

        print(
    f'{jogo[0]:<4}'
    f'{jogo[1][:23]:<25}'
    f'R${jogo[3]:<8}'
    f'{jogo[5][:20]:<20}'
)


    print('=' * largura)


    cursor.close()
    conn.close()