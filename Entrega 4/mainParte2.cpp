/*Grupo:
*Pedro Henrique Goncalves Teixeira - 11821BCC008
*Antonio Pedro Rodrigues Santos - 11821BCC021
*Marillia Soares Rodrigues - 11821BCC020
*/

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

using namespace std;

// utilize um tamanho de histograma adequado para a quantidade de buckets para os conjuntos de dados fornecidos
#define TAM_HISTOGRAMA 200

int getHash(char *str) {
    // implementar funcao hash para distribuir strings com uniformidade e aleatoriedade

    int key = str[0];
    int geraNum = rand();
    int randKey;

    if(randKey % 1000000 == 0){
        randKey = 1;
    }else{
        randKey = geraNum % 1000000;
    }

    int i = 0;
    do{
        key = (key * 256 + str[i] + randKey) % TAM_HISTOGRAMA;
        i++;
    }while(str[i] != '\0');

    return key % TAM_HISTOGRAMA;
}

int main() {
    FILE *f = fopen("dblp-1m.txt","rb");
    if (f == NULL) {
        printf("Sinto muito, nao consegui abrir arquivo de dados.");
        return 0;
    }

    srand (time(NULL));
    char linha[1024];

    // vetor que armazenara histograma de contagem
    int histograma[TAM_HISTOGRAMA];
    for (int i = 0; i < TAM_HISTOGRAMA; i++)
        histograma[i] = 0;

    int contagem = 0;
    while (true) {
        // ler linha
        fgets(linha,1024,f);
        if (feof(f))
            break;

        // computar hash e atualizar contagem no histograma
        int hash = getHash(linha);
        histograma[hash]++;

        // para fornecer algum feedback para usuario nao pensar que programa travou, imprimir um caractere a cada 1000 elementos
        contagem++; if (contagem % 1000 == 0) { printf("."); fflush(stdout); }
    }
    fclose(f);

    // criar grafico de contagem do hash
    FILE *grafico = fopen("graficoParte2.plt","wb");
    fprintf(grafico,"# executar esse arquivo com GNUPLOT\n");
    fprintf(grafico,"# http://www.gnuplot.info/download.html\n");
    fprintf(grafico,"# no linux: gnuplot grafico.plt\n");
    fprintf(grafico,"# no windows: wgnuplot grafico.plt\n");
    fprintf(grafico,"set title \"Histograma\"\n");
    fprintf(grafico,"set encoding iso_8859_1\n");
    fprintf(grafico,"set xlabel \"Hash\"\n");
    fprintf(grafico,"set ylabel \"Quantidade\"\n");
    fprintf(grafico,"plot '-' title 'Quantidade' with linespoints linewidth 2 linetype 1 pointtype 1\n");
    for (int i = 0; i < TAM_HISTOGRAMA; i++)
        fprintf(grafico,"%d %d\n",i,histograma[i]);
    fprintf(grafico,"end\n");
    fprintf(grafico,"pause -1\n");
    fclose(grafico);

    printf("\n\nThat's all, folks!\n\n");

    return 0;
}
