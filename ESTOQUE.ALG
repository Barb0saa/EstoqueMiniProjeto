Algoritmo "Controle de Estoque"
 //Disciplina : Linguagem de Programa??o I
 //Professor  : Bruno Torres
 //Aluno      : Gabriel Barbosa do Amaral


Var
    //dados do produto (cada vetor ? um atributo)
   descricoes  :vetor [1..4] de caractere
   quantidades :vetor [1..4] de inteiro
   precosVendas:vetor [1..4] de real
   //Vetores do estoque
   vendaqtt   :inteiro    //definir a quantidade de tal produto
   codItem    :inteiro    //c?digo do produto cadastrado
   opc,opc2   :caractere  //selecionar as op??es do menu
   fimcad     :real       //usado para acompanhar a exibi??o do ultimo cadastro
   icod       :inteiro    //usado para ler o c?digo do menu editar
procedimento cadastro_item
//Respons?vel em cadastar um produto no vetor
//1-Produto a ser cadastrado

Inicio
   codItem <- codItem+1 //constante que dar? o c?digo ao produto
   escreval("**  Cadastro de produto  **")
   escreva ("Descri??o :")
   leia(descricoes[codItem])
   escreva ("Quantidade :")
   leia(quantidades[codItem])
   escreva ("Valor de venda :")
   leia (precosVendas[codItem])
   limpatela
   //Abaixo ir? mostrar o produto cadastrado e suas informa??es
   escreval()
   escreval()
   escreval ("Produto cadastrado :",descricoes[coditem])
   escreval ("C?digo :",coditem)
   escreval ("Quantidade :",quantidades[coditem])
   escreval ("Valor de venda : R$",precosVendas[coditem])
   escreval()
   escreval ("Para visualizar o c?digo novamente, imprima o relat?rio")
   escreval ("de produtos.")
   escreval()
   escreval("Pressione ENTER para voltar ao menu")
   leia(opc)
fimProcedimento

procedimento imprimir_produtos()//Respons?vel em exibir os dados dos produtos
var
   i :inteiro
inicio
   escreval("Voc? possui no estoque os seguintes itens: ")
   para i de 1 ate codItem faca //do primeiro at? a quantidade j? cadastrada
      escreval()
      escreval("C?digo :",i)
      escreval("Descri??o : ",descricoes[i])
      escreval("Quantidade :",quantidades[i])
      escreval("valor de venda : R$",precosVendas[i])
      escreval("------------------------------------------")
      escreval()
   fimpara
   escreva ("Pressione ENTER para voltar ao menu")
   leia(opc)
fimProcedimento

procedimento editar()
//Respons?vel em verificar qual produto vai se alterar, coletar os novos dados
//e solicitar o cadastro da altera??o no vetor
var
   novaQtd :inteiro
inicio
   escreval("Insira o c?digo do produto que deseja pesquisar: ")
   leia(icod)
   se (icod >=1) E (icod <= codItem) ent?o //verificar se ? um c?digo v?lido
      escreval("C?digo :",icod) //o c?digo ? a posi??o no vetor!!!
      escreval("Descri??o :",descricoes[icod])
      escreval("Quantidade :",quantidades[icod])
      escreval("valor de venda : R$",precosVendas[icod])
      escreval()
      escreval("Digite a nova quantidade do estoque, ou")
      escreval("caso n?o queira modificar, digite a quantidade atual.")
      leia(novaQtd)
      quantidades[icod]:=novaQtd //atualiza a quantidade caso tenha altera?ao
      escreval("O produto ",descricoes[icod]," agora possui ",quantidades[icod]," unidades")
      escreval()
      escreval("Pressione ENTER para continuar")
      leia (opc)
   fimse
fimprocedimento

procedimento venda()
var
   i :inteiro
inicio
   escreval("Voc? possui no estoque os seguintes itens: ")
   para i de 1 ate codItem faca //do primeiro at? a quantidade j? cadastrada
      escreval()
      escreval("C?digo :",i)
      escreval("Descri??o : ",descricoes[i])
      escreval("Quantidade :",quantidades[i])
      escreval("valor de venda : R$",precosVendas[i])
      escreval("------------------------------------------")
      escreval()
   fimpara
   escreval("Insira o c?digo do produto que deseja vender:")
   leia(icod)
   se (icod >=1) E (icod <= codItem) ent?o //verificar se ? um c?digo v?lido
      escreval("Descri??o :",descricoes[icod])
      escreval("Quantidade :",quantidades[icod])
      escreval("Valor de venda : R$",precosVendas[icod], " por unidade")
      escreval()
      escreval("Quantas unidades deseja vender?")
      leia (vendaqtt)
      escreval()
      escreval("Foram vendidas",vendaqtt," unidades por R$",precosVendas[icod] * vendaqtt)
      escreval()
      quantidades[icod] <- quantidades[icod] - vendaqtt
      escreval("A quantidade de ",descricoes[icod]," foi atualizada!")
      escreval()
      escreval("Pressione ENTER para continuar")
      leia (opc)
   fimse
fimprocedimento

procedimento menu_estoque()
inicio
   repita
      limpaTela
      escreval("-----------ESTOQUE-----------")
      escreval()
      escreval("       1-Cadastro de produto    ")
      escreval("       2-Pesquisar/Editar   ")
      escreval("       3-Venda de mercadoria       ")
      escreval("       5-Sair                ")
      escreval()
      escreval("       0-*Imprimir produtos  ")
      escreval()
      escreval("  Possuem atualmente",codItem," produtos")
      escreval("     cadastrados no estoque!")
      escreval()
      escreva ("Comando: ")
      leia(opc)
      escolha (opc)
      caso "1"
         limpatela
         cadastro_item() //cadastrar produto
      caso "2"
         limpatela
         editar() //pesquisar ou editar item ja cadastrado
      caso "3"
         limpatela
         venda() //vender produto
      caso "0"
         limpatela
         imprimir_produtos() //mostra na tela os produtos ja cadastrados
      caso "5"
      fimEscolha //finaliza o programa
   ate opc="5"
fimProcedimento


INICIO
   codItem <- 0  //inicializa o controlador de c?digo
   menu_estoque()
Fimalgoritmo