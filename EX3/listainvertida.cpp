#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fstream>
#include <bits/stdc++.h>

using namespace std;

void printLinha(int offset, FILE *arq){
    int posicao = ftell(arquivo);
    char linha[2048];
    while(posicao < offset){
        fgets(linha, 2047, arq);
        posicao = ftell(arq);
    }
    printf("%s", linha);
}

class listaInvertida{
    FILE *index;
    FILE *chaves;
    int posIndex;
    int posChaves;
    priKey pedro;
    secKey pedro2;
    stack<int> stack;

    typedef struct{
        int offset;
        int prox;
    }priKey;

    typedef struct{
        char nome[50];
        int no;
    }secKey;

    abreArq(){
        chaves = fopen("PrimaryKeysFile.bin", "wb+");
        index = fopen("SecondaryIndexFile.bin", "wb+");

        posChaves = 0;
        posIndex = 0;
    }

    fechaArq(){
        fclose(chaves);
        fclose(index)
    }


    int posPalavra(char *palavra){
        fseek(index, 0, SEEK_SET);
        while(fread(&pedro, sizeof(pedro), 1, index){
            if(strcomp(pedro.nome, palavra) == 0)
                return ftell(index) - sizeof(pedro);
        }
        return 1;
    }

    void add(char *palavra, int offset){
        int posicao = posPalavra(palavra);

        strcpy(pedro.nome, palavra);
        pedro2.offset = offset;

        if(pos == -1){
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

    int *procura(char *palavra, int *quantidade){
        int i = 0;
        *qtd = 0;
        int posicao = posPalavra(palavra);

        fseek(index, posicao, SEEK_SET);
        fread(&pedro, sizeof(pedro), 1, index);

        fseek(chaves, pedro.no, SEEK_SET);
        fread(&pedro2, sizeof(pedro2), 1, chaves);

        stack.push(pedro2.offset);

        while(pedro2.prox != -1){
            fseek(chaves, pedro2.prox, SEEK_SET);
            fread(&pedro2, sizeof(pedro2), 1, chaves);
            stack.push(pedro2.offset);
        }

        *qtd = stack.size();
        int *offset2 = new int[*qtd];

        while(!stack.empty()){
            offset2[i++] = stack.top();
            stack.pop();
        }
        return offset2;
    }
};

int main(int argc, char** argv){
    ifstream in("biblia.txt");

    char *palavra = new char[50];
    int offset;
    int cont = 0;

    listaInvertida lst;

    while(!EOF){
        in >> palavra;
        offset = tellg();

        int tamanho = strlen(palavra);
        if((palavra[tamanho - 1] == '.') || (palavra[tamanho - 1] == ',') || (palavra[tamanho - 1] == ';') || (palavra[tamanho - 1] == ':') || (palavra[tamanho - 1] == '?') || (palavra[tamanho - 1] == '!'))
            palavra[tamamho - 1] = '\0';

        if (!((palavra[0] == '#') || (palavra[0] == '[') || ((palavra[0] >= '0') && (palavra[0] <= '9')))) {
            lst.add(palavra, offset);
            cont++;
            if(cont % 1000 == 0){
                fflush(stdout);
            }
        }
        in.close();

        int opcao = 1;
        while(opcao = 1){
            printf("Digite a palavra para buscar: ");
            gets(palavra);
            int linhas;
            int *offset3 = lst.procura(palavra, &linhas);
            if(linhas > 0){
                FILE *arq = fopen("biblia.txt", "rt");
                for(int i = 0; i < linhas; i++){
                    printLinha(offset3[i], arq);
                }
                fclose(arq);
            }else{
                printf("Palavra nao encontrada!");
            }
            printf("Voce quer continuar procurando?");
            printf("1 - SIM");
            printf("2 - NAO");
        }
    }

    return 0;
}
