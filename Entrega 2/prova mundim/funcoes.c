#include "header.h"

struct TMatQuad
{
    int *dados;
    int ordem; // ordem indica o tamanho da matriz. Por exemplo, ordem 3 indica uma matriz 3x3
};


TMatQuad* cria_matquad(int ordem){

}

void libera_matquad(TMatQuad *mat){

}

TMatQuad* cria_mat_identidade(int ordem){
    for(int i = 0; i < ordem; i++){
        for(int j = 0; j < ordem; j++){
            if(i == j){
                printf("1");
            }else{
                printf("0");
            }
            printf("\t");
        }
        printf("\n");
    }

}

int* copia_diagonal(TMatQuad *m){

}
