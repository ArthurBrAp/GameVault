from cadastrocliente import cadastrar_cliente
from cadastrojogo import cadastrar_jogo
from listarjogos import listar_jogos
from comprarjogo import comprar_jogo

while True:
    
    print('\n===GAMEVAULT===')
    print('1 - Cadastrar cliente')
    print('2 - Cadastrar jogo')
    print('3 - Listar jogos')
    print('4 - Comprar jogos')
    print('0 - Sair')

    opcao = input('Escolha: ')

    if opcao == '1':
        cadastrar_cliente()

    elif opcao == '2':
        cadastrar_jogo()

    elif opcao == '3':
        listar_jogos()

    elif opcao == '4':
        comprar_jogo()

    elif opcao == '0':
        print('Encerrado!')
        break

    else:
        print('Opção inválida')