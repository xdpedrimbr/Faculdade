/*NOME DO GRUPO:
Pedro Henrique Goncalves Teixeira - 11821BCC008
Maríllia Soares Rodrigues - 11821BCC020
Hendrik Abdalla Hermann - 11911BCC034
*/

#include <iostream>
#include <bits/stdc++.h>
using namespace std;

void limpa(){
    setbuf(stdin, NULL);
}

//Tamanho da estrutura: 113 bytes
struct item{
    int cep;
    char uf[3];
    char cidade[39];
    char logradouro[67];
};

char *tamanhoigual(char *str, int tam){
    for(int i = 0; i < tam - 1; i++){
        if(str[i] == '\0'){
            str[i] = ' ';
            str[i + 1] = '\0';
        }
    }
    return str;
}

int main()
{
    //TESTADO COM ARQUIVO DE 6 LINHAS
    //TESTADO COM ARQUIVO DE 6 LINHAS
    //TESTADO COM ARQUIVO DE 6 LINHAS
    //TESTADO COM ARQUIVO DE 6 LINHAS
    //TESTADO COM ARQUIVO DE 6 LINHAS
    //TESTADO COM ARQUIVO DE 6 LINHAS
    FILE *arquivoEntrada = fopen("cep3.txt", "r");
    FILE *arquivoSaida = fopen("cep2.txt", "w");

    string inputStringFile;
    string breakString = "\t";
    string substring;
    struct item item;
    long int qtdLinhas = 0;

    char c;
    string teste;

    while(!feof(arquivoEntrada)){
        while(fread(&c, sizeof(char), 1, arquivoEntrada) == 1 && c != '\n'){
            teste.push_back(c);
        };

        string cep, uf, cidade, logradouro;
        cep = teste.substr(0, teste.find("\t"));

        try{
            item.cep = stoi(cep);
        }catch(...){
            cout << "Foram lidas " << qtdLinhas << " linhas" << endl;
            cout << "Falha na conversao" << endl;
            return 0;
        }

        teste.erase(0, teste.find("\t")+1);

        uf = teste.substr(0, teste.find("\t"));
        strcpy(item.uf, uf.c_str());

        teste.erase(0, teste.find("\t")+1);

        cidade = teste.substr(0, teste.find("\t"));
        strcpy(item.cidade, cidade.c_str());

        teste.erase(0, teste.find("\t")+1);

        logradouro = teste.substr(0, teste.find("\t"));
        strcpy(item.logradouro, logradouro.c_str());

        teste.erase(0, teste.find("\t")+1);

        qtdLinhas++;

        cout << qtdLinhas << endl;

        cout << item.cep << endl;
        cout << item.uf << endl;
        cout << item.cidade << endl;
        cout << item.logradouro << endl;
        cout << endl;

        char varcep[8];

        sprintf(varcep, "%d", item.cep);
        fwrite(tamanhoigual(varcep, sizeof(varcep)), sizeof(char), sizeof(varcep), arquivoSaida);
        fwrite(tamanhoigual(item.uf, sizeof(item.uf)), sizeof(char), sizeof(item.uf), arquivoSaida);
        fwrite(tamanhoigual(item.cidade, sizeof(item.cidade)), sizeof(char), sizeof(item.cidade), arquivoSaida);
        fwrite(tamanhoigual(item.logradouro, sizeof(item.logradouro)), sizeof(char), sizeof(item.logradouro), arquivoSaida);
        fwrite("\n", sizeof(char), 1, arquivoSaida);

        teste.erase(0, teste.size());

    }

    fclose(arquivoEntrada);
    fclose(arquivoSaida);

    ifstream arquivoEntrada1("cep2.txt");                           //Abre arquivo para leitura
    int qtdResultados;
    string termoBusca, resultado;

    while(1){

        cout << "Digite 1 para a busca sequencial, 2 para a busca por linha e 3 para sair: ";
        int opcaobusca;
        scanf("%d", &opcaobusca);

        if(opcaobusca == 1){
            cout << "Qual termo deseja buscar (busca sequencial): ";
            limpa();
                                                                    //Limpa o buffer do teclado para a leitura da string de busca
            getline (cin, termoBusca);
            cout << termoBusca << endl;
            limpa();
                                                                    //Limpa o buffer do teclado para a leitura da string de busca                                                                    //Busca por rua
            qtdResultados = 0;                                      //Variavel para mostrar a quantidade de resultados encontrados
            arquivoEntrada1.clear();                                //Limpa o estado do ifstream antes de chamar a proxima instrucao para leitura do arquivo
            arquivoEntrada1.seekg(0);                               //Posiciona o cursor na primeira linha e primeiro caractere do arquivo
            qtdLinhas = 0;                                          //Variavel para mostrar a quatidade de linhas lidas no arquivoEntrada1

            while(getline(arquivoEntrada1, resultado)){
                qtdLinhas++;
                if(resultado.find(termoBusca, 0) != string::npos){
                    cout << resultado << endl;
                    qtdResultados++;
                }
            }

            cout << "Obteve ";
            cout << qtdResultados;
            cout << " resultados." << endl;


        }

        if(opcaobusca == 2){
            cout << "Qual linha deseja buscar (busca por posicao): ";
            int buscaLinha;
            scanf("%d", &buscaLinha);
            limpa();
                                                                    //Limpa o buffer do teclado para a leitura da string de busca                                                                    //Busca por rua
            qtdResultados = 0;                                      //Variavel para mostrar a quantidade de resultados encontrados
            arquivoEntrada1.clear();                                //Limpa o estado do ifstream antes de chamar a proxima instrucao para leitura do arquivo
            arquivoEntrada1.seekg(0);                               //Posiciona o cursor na primeira linha e primeiro caractere do arquivo
            qtdLinhas = 0;                                          //Variavel para mostrar a quatidade de linhas lidas no arquivoEntrada1

            while(getline(arquivoEntrada1, resultado)){
                qtdLinhas++;

                if(buscaLinha == qtdLinhas){
                    cout << "\n";
                    cout << resultado << endl;
                    qtdResultados++;
                }
            }

            cout << "Obteve ";
            cout << qtdResultados;
            cout << " resultados." << endl;
            cout << "\n\n";
        }
    }
}
