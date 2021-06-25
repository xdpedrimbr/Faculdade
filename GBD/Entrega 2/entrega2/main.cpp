/*
 * File:   main.cpp
 * Author: Pedro Henrique Goncalves Teixeira - 11821BCC008
 *         Marillia Soares Rodrigues - 11821BCC020
 *         Hendrik Abdala Hermman - 11911BCC034
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <bits/stdc++.h>

using namespace std;
class MeuArquivo {
public:
    struct cabecalho { int quantidade; int disponivel = -1; } cabecalho;
    typedef struct registro { int tamanho; int prox; char asterisco = '*'; } registro;

    // construtor: abre arquivo. Essa aplicacao deveria ler o arquivo se existente ou criar um novo.
    // Entretando recriaremos o arquivo a cada execucao ("w+").
    MeuArquivo() {
        fd = fopen("dados.dat","w+");
        fwrite(&cabecalho, sizeof(cabecalho), 1, fd);
        fflush(fd);
    }

    // Destrutor: fecha arquivo
    ~MeuArquivo() {
        fclose(fd);
    }

    // Insere uma nova palavra, consulta se há espaco disponível ou se deve inserir no final
    void inserePalavra(char *palavra) {
        this->substituiBarraNporBarraZero(palavra); // funcao auxiliar substitui terminador por \0

        char *str;
        if(strlen(palavra) + 1 < 8) {
            str = (char*) malloc(8);
            strcpy(str, palavra);
        }else{
            str = palavra;
        }

        if(!addLista(palavra)){
            fseek(fd, 0, SEEK_END);

            int info = ftell(fd);
            int pal = strlen(palavra);
            int tam = max(int(sizeof(registro) - sizeof(int)), pal + 1);

            fwrite(&tam, sizeof(int), 1, fd);
            fwrite(palavra, sizeof(char), tam, fd);

            fflush(fd);
        }

    atualizaCabecalho(1);

    }

    // Marca registro como removido, atualiza lista de disponíveis, incluindo o cabecalho
    void removePalavra(int offset) {
        if(!cabecalho.quantidade || tamanhoArquivo() <= offset){
            cout << "Nao foi possivel remover do Arquivo!" << endl;
        }

        registro regis;
        fseek(fd, offset, SEEK_SET);

        fread(&(regis.tamanho), sizeof(int), 1, fd);
        regis.prox = cabecalho.disponivel;
        fseek(fd, offset-ftell(fd), SEEK_CUR);

        if(fwrite(&regis, sizeof(registro), 1, fd) != 1){
            cout << "ERRO" << endl;
        }
        cabecalho.disponivel = offset;
        fflush(fd);
        atualizaCabecalho(-1);
    }

    // BuscaPalavra: retorno é o offset para o registro
    // Nao deve considerar registro removido
    int buscaPalavra(char *palavra) {
        this->substituiBarraNporBarraZero(palavra); // funcao auxiliar substitui terminador por \0

        char str[30];
        int deslocamento = sizeof(cabecalho);
        int fim = tamanhoArquivo();

        fseek(fd, deslocamento, SEEK_SET);

        while(deslocamento < fim){
            int tam;
            fread(&tam, sizeof(int), 1, fd);
            fread(str, sizeof(char), tam, fd);

            if(str[0] == '*'){
                continue;
            }
            if(!strcmp(str, palavra)){
                cout << "A palavra desejada eh: " << palavra;
                return deslocamento;
            }
            deslocamento = ftell(fd);
        }
        // retornar -1 caso nao encontrar
        return -1;
    }

private:
    // descritor do arquivo é privado, apenas métodos da classe podem acessa-lo
    FILE *fd;

    int addLista(char *palavra) {
        int tampal = strlen(palavra)+1; // \0
        int offset = cabecalho.disponivel, previous=0;

        fseek(fd, 0, SEEK_SET);

        while(offset != -1) {
            //printf("offset = %d\n", offset);
            fseek(fd, offset-ftell(fd), SEEK_CUR);
            registro regis;
            fread(&regis, sizeof(registro), 1, fd);

            if(regis.tamanho >= tampal) {
                fseek(fd, -(sizeof(registro) - sizeof(int)), SEEK_CUR);

                if(fwrite(palavra, sizeof(char), tampal, fd) != tampal) {
                    printf("Problema ao escrever a palavra\n");
                }
                fflush(fd);
                break;
            }
            previous = offset;
            offset = regis.prox;
        }
        if(offset != -1) {
            printf("Palavra <%s> inserida na lista com sucesso! pos = %d\n", palavra, offset);
            return 1;
        }
        return 0;
    }

    // funcao auxiliar substitui terminador por \0
    void substituiBarraNporBarraZero(char *str) {
        int tam = strlen(str); for (int i = 0; i < tam; i++) if (str[i] == '\n') str[i] = '\0';
    }

    void atualizaCabecalho(int x) {
        cabecalho.quantidade += x;
    }

    int tamanhoArquivo() {
        fseek(fd, 0, SEEK_END);
        return ftell(fd);
    }
};

int main(int argc, char** argv) {
    // abrindo arquivo dicionario.txt
    FILE *f = fopen("dicionario.txt","rt");

    // se não abriu
    if (f == NULL) {
        printf("Erro ao abrir arquivo.\n\n");
        return 0;
    }

    char *palavra = new char[50];

    // criando arquivo de dados
    MeuArquivo *arquivo = new MeuArquivo();
    while (!feof(f)) {
        fgets(palavra,50,f);
        arquivo->inserePalavra(palavra);
    }

    // fechar arquivo dicionario.txt
    fclose(f);

    printf("Arquivo criado.\n\n");

    char opcao;
    do {
        printf("\n\n1-Insere\n2-Remove\n3-Busca\n4-Sair\nOpcao:");
        opcao = getchar();
        if (opcao == '1') {
            printf("Palavra: ");
            scanf("%s",palavra);
            arquivo->inserePalavra(palavra);
        }
        else if (opcao == '2') {
            printf("Palavra: ");
            scanf("%s",palavra);
            int offset = arquivo->buscaPalavra(palavra);
            if (offset >= 0) {
                arquivo->removePalavra(offset);
                printf("Removido.\n\n");
            }
        }
        else if (opcao == '3') {
            printf("Palavra: ");
            scanf("%s",palavra);
            int offset = arquivo->buscaPalavra(palavra);
            if (offset >= 0)
                printf("Encontrou %s na posição %d\n\n",palavra,offset);
            else
                printf("Não encontrou %s\n\n",palavra);
        }
        if (opcao != '4') opcao = getchar();
    } while (opcao != '4');

    printf("\n\nAte mais!\n\n");

    return (EXIT_SUCCESS);
}
