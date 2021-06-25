/*
 * File:   main.cpp
 *  Pedro Henrique Goncalves Teixeira - 11821BCC008
 *  Antonio Pedro Rodrigues Santos - 11821BCC021
 *  Marillia Soares Rodrigues - 11821BCC020
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fstream>
#include <bits/stdc++.h>

using namespace std;

// remove pontuacao de uma palavra
void removePontuacao (char *palavra) {
    int length = strlen(palavra);
    if (
        (palavra[length-1] == '.') || (palavra[length-1] == ',') || (palavra[length-1] == ';') ||
        (palavra[length-1] == ':') || (palavra[length-1] == '?') || (palavra[length-1] == '!')
       )
        palavra[length-1] = '\0';
}

// imprime linha do arquivo com base no offset da palavra
void imprimeLinha(int offset,FILE *f) {
    int pos = ftell(f);
    char linha[2048];
    while (pos < offset) {
        fgets(linha,2047,f);
        pos = ftell(f);
    }
    printf("%s",linha);
}

// classe que implementa a lista invertida
class listaInvertida {
public:
    typedef struct{
        int offset;
        int prox;
    }priKey;

    typedef struct{
        char nome[50];
        int no;
    }secKey;

    // construtor
    listaInvertida() {
        chaves = fopen("chaves.bin", "wb+");
        index = fopen("index.bin", "wb+");

        posChaves = 0;
        posIndex = 0;
    }
    // destrutor
    ~listaInvertida() {
        fclose(chaves);
        fclose(index);
    }

    int posPalavra(char *palavra){
        fseek(index, 0, SEEK_SET);
        while(fread(&pedro, sizeof(pedro), 1, index)){
            if(strcmp(pedro.nome, palavra) == 0)
                return ftell(index) - sizeof(pedro);
        }
        return -1;
    }

    // adiciona palavra na estrutura
    void adiciona(char *palavra, int offset) {
        int posicao = posPalavra(palavra);

        strcpy(pedro.nome, palavra);
        pedro2.offset = offset;

        if(posicao == -1){
            pedro2.prox = -1;
            fseek(index, 0, SEEK_END);
        }else{
            pedro2.prox = pedro.no;
            fseek(index, posicao, SEEK_SET);
        }

        pedro.no = posIndex;
        posIndex += sizeof(pedro2);

        fseek(chaves, 0, SEEK_END);

        fwrite(&pedro, sizeof(pedro), 1, index);
        fwrite(&pedro2, sizeof(pedro2), 1, chaves);
    }
    // realiza busca, retornando vetor de offsets que referenciam a palavra
    int * busca(char *palavra, int *qtd) {
        int i = 0;
        *qtd = 0;
        int posicao = posPalavra(palavra);

        fseek(index, posicao, SEEK_SET);
        fread(&pedro, sizeof(pedro), 1, index);

        fseek(chaves, pedro.no, SEEK_SET);
        fread(&pedro2, sizeof(pedro2), 1, chaves);

        stack<int> p;

        p.push(pedro2.offset);

        while(pedro2.prox != -1){
            fseek(chaves, pedro2.prox, SEEK_SET);
            fread(&pedro2, sizeof(pedro2), 1, chaves);
            p.push(pedro2.offset);
        }

        *qtd = p.size();
        int *offset2 = new int[*qtd];

        while(!p.empty()){
            offset2[i++] = p.top();
            p.pop();
        }
        return offset2;
    }


private:
    FILE *index;
    FILE *chaves;
    int posIndex;
    int posChaves;
    priKey pedro2;
    secKey pedro;
};

// programa principal
int main(int argc, char** argv) {
    // abrir arquivo
    ifstream in("biblia.txt");
    if (!in.is_open()){
        printf("\n\n Nao consegui abrir arquivo biblia.txt. Sinto muito.\n\n\n\n");
    }
    else{
        // vamos ler o arquivo e criar a lista invertida com as palavras do arquivo
        char *palavra = new char[100];
        int offset, contadorDePalavras = 0;
        listaInvertida lista;
        // ler palavras
        while (!in.eof()) {
            // ler palavra
            in >> palavra;
            // pegar offset
            offset = in.tellg();
            // remover pontuacao
            removePontuacao(palavra);
            // desconsiderar palavras que sao marcadores do arquivo
            if (!((palavra[0] == '#') || (palavra[0] == '[') || ((palavra[0] >= '0') && (palavra[0] <= '9')))) {
                //printf("%d %s\n", offset,palavra); fflush(stdout); // debug :-)
                lista.adiciona(palavra, offset);
                contadorDePalavras++;
                if (contadorDePalavras % 1000 == 0) { printf(".");  fflush(stdout); }
            }
        }
        in.close();

        // agora que ja construimos o indice, podemos realizar buscas
        do {
            printf("\nDigite a palavra desejada ou \"SAIR\" para sair: ");
            scanf("%s",palavra);
            if (strcmp(palavra,"SAIR") != 0) {
                int quantidade;
                // busca na lista invertida
                int *offsets = lista.busca(palavra,&quantidade);
                // com vetor de offsets, recuperar as linhas que contem a palavra desejada
                if (quantidade > 0) {
                    FILE *f = fopen("biblia.txt","rt");
                    for (int i = 0; i < quantidade; i++)
                        imprimeLinha(offsets[i],f);
                    fclose(f);
                }
                else
                    printf("nao encontrou %s\n",palavra);
            }
        } while (strcmp(palavra,"SAIR") != 0);

        printf("\n\nAte mais!\n\n");
    }

    return (EXIT_SUCCESS);
}

