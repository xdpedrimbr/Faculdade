/*NOME DO GRUPO:
Pedro Henrique Goncalves Teixeira - 11821BCC008
Maríllia Soares Rodrigues - 11821BCC020
Hendrik Abdalla Hermann - 11911BCC034
*/

#include <iostream>
#include <bits/stdc++.h>

using namespace std;

int main()
{
    ifstream pont_arq("cep.txt");
    ofstream pont_arq2("cep2.txt");

    string save, inputString;
    string breakString = "\t";
    string separada;
    int cont = 3; //conta os \t

    while(getline (pont_arq, save)){  //pega a linha do arquivo e salva na string save ate terminarem as linhas
        for(int i = 0; i <= cont; i++){
            int posTab = save.find(breakString); //recebe a posicao do TAB
            separada = save.substr(0, posTab);   //pega a linha toda
            save.erase(0, posTab+1);             //exclui o campo + TAB
            if(i != 0){
                inputString.insert(0, "|");      //prepara a string pra jogar no arquivo, adicionando os pipes
            }
            inputString.insert(0, separada);      //adiciona as frases
        }
        pont_arq2 << inputString << endl;
        inputString = "";
    }

    cout << "Dados salvos no arquivo com sucesso!\n";

    pont_arq2.close();
    cout << "O arquivo foi fechado com sucesso! Pronto para abri-lo novamente!\n\n";

    ifstream pont_arq3("cep2.txt");

    int o = 0;
    int qtdRes;
    int qtdLinhas;
    string achado;
    while(1){
        cout << "Opcoes de busca: \n";
        cout << "1 - endereco \n";
        cout << "2 - cidade \n";
        cout << "3 - UF \n";
        cout << "4 - CEP \n";
        cout << "5 - Sair da busca \n";
        cout << "Digite sua opcao: ";
        cin >> o;

        setbuf(stdin, NULL);

        if(o == 5){
            pont_arq3.close();
            cout << "Arquivo fechado com sucesso!\n";
            break;
        }

        string procura;
        cout << "\nDigite o termo que deseja procurar: "<< endl;
        getline(cin, procura);

        setbuf(stdin, NULL);

        string save2;


        if(o == 1){                                 //busca por rua
            qtdRes = 0;
            pont_arq3.clear();
            pont_arq3.seekg(0);
            qtdLinhas = 0;
            while(getline (pont_arq3, achado)){
                qtdLinhas++;
                save2 = achado.substr(0, achado.find("|"));
                if(save2.find(procura, 0) != string::npos){
                    cout << achado << endl;
                    qtdRes++;
                }
            }
        }
        else if(o == 2){                            //busca por didade
            qtdRes = 0;
            pont_arq3.clear();
            pont_arq3.seekg(0);
            qtdLinhas = 0;
            while(getline (pont_arq3, achado)){
                qtdLinhas++;
                save2 = achado.substr(achado.find("|")+1, achado.size());
                if(save2.find(procura, 0) != string::npos){
                    cout << achado << endl;
                    qtdRes++;
                }
            }
        }
        else if(o == 3){                        //busca por UF
            qtdRes = 0;
            pont_arq3.clear();
            pont_arq3.seekg(0);
            qtdLinhas = 0;
            while(getline (pont_arq3, achado)){
                qtdLinhas++;
                save2 = achado.substr(achado.find("|")+1, achado.size());
                save2 = save2.substr(save2.find("|")+1, save2.size());
                if(save2.find(procura, 0) != string::npos){
                   cout << achado << endl;
                    qtdRes++;
              }
            }
        }
        else if(o == 4){                        //busca por CEP
            qtdRes = 0;
            pont_arq3.clear();
            pont_arq3.seekg(0);
            qtdLinhas = 0;
            while(getline (pont_arq3, achado)){
                qtdLinhas++;
                save2 = achado.substr(achado.find("|")+1, achado.size());
                save2 = save2.substr(save2.find("|")+1, save2.size());
                save2 = save2.substr(save2.find("|")+1, save2.size());
                if(save2.find(procura, 0) != string::npos){
                    cout << achado << endl;
                    qtdRes++;
                }
            }
        }
       cout << "\nForam lidas " << qtdLinhas << " linhas.\n";
       cout << "Obteve " << qtdRes << " resultados.\n\n";
    }

    return 0;
}
