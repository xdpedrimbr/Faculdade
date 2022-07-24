import subprocess

senhas = open("senhasDescobertas.txt", "a")
possiveisSenhas = ["senhasPokemon.txt", "senhas1984.txt", "senhasPapel.txt"]

def openSSL(arq, arquivo):
    for c in arq:
        subprocess.check_output("openssl enc -d -aes-256-cdc -in ./cifrados/file" + str(arquivo) + ".enc -out saida.txt -pass pass:" + c, shell=True, stderr=subprocess.STDOUT)
        saida = open("saida.txt", "r")
        leitor = saida.read()

        if leitor == "teste\n":
            print("\nENCONTRADA!")
            senhas.write(c)
            leitor.close()
        else:
            print("NAO FOI ENCONTRADA NENHUMA SENHA!")

    return 0

for i in possiveisSenhas:
    for arquivo in range(0, 3):
        abre = open(i, "r")
        if openSSL(abre, arquivo) == 1:
            print(".")
        else:
            abre = open(i, "r")
            openSSL(abre, arquivo)



