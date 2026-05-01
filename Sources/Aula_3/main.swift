import Foundation

class Academia{
    private (set) var listaAlunos: [String: Aluno] = [:]
    private (set) var listaInstrutores: [String: Instrutor] = [:]
    private (set) var listaAparelhos: [String: Aparelho] = [:]
    private (set) var listaTC: [String: TurmaColetiva] = [:]
    private (set) var listaTP: [String: TreinoComPersonal] = [:]
    private (set) var aparelhosQuebrados: [Aparelho] = []

    init(){}

    func adicionarAluno(aluno: Aluno) -> Bool{
        if (listaAlunos[aluno.matricula] != nil){
            print("Aluno já se encontra matriculado.")
            return false
        }

        listaAlunos[aluno.matricula] = aluno
        print("Aluno matriculado com sucesso.")
        return true
    }

    func adicionarInstrutor(instrutor: Instrutor) -> Bool{
        if (listaInstrutores[instrutor.idFuncionario] != nil){
            print("Instrutor já foi anteriormente cadastrado.")
            return false
        }

        listaInstrutores[instrutor.idFuncionario] = instrutor
        print("Instrutor cadastrado com sucesso.")
        return true
    }

    func adicionarAparelho(aparelho: Aparelho) -> Bool{
        if (listaAparelhos[aparelho.nomeMaquina] != nil){
            print("Aparelho já foi anteriormente cadastrado.")
            return false
        }

        listaAparelhos[aparelho.nomeMaquina] = aparelho
        print("Aparelho cadastrado com sucesso.")
        return true
    }

    func adicionarTurmaColetiva(tc: TurmaColetiva) -> Bool{
        if (listaTC[tc.nome] != nil){
            print("Turma já foi anteriormente cadastrada.")
            return false
        }

        listaTC[tc.nome] = tc
        print("Turma cadastrada com sucesso.")
        return true
    }

    func adicionarTreinoComPersonal(tp: TreinoComPersonal) -> Bool{
        if (listaTP[tp.nome] != nil){
            print("Treino com personal já foi anteriormente cadastrado.")
            return false
        }
        guard let aluno = consultarAluno(matricula: tp.matriculaAluno) else {
            print("Erro: Aluno não encontrado na academia.")
            return false
        }
        if !aluno.plano.atributos.personalTrainer {
            print("Acesso Negado: O plano atual do aluno (\(aluno.plano.atributos.nome)) não autoriza esta modalidade.")
            return false
        }

        listaTP[tp.nome] = tp
        print("Treino com personal cadastrado com sucesso.")
        return true
    }

    func consultarAluno (matricula: String) -> Aluno?{
        return listaAlunos[matricula]
    }

    func consultarInstrutor (idFuncionario: String) -> Instrutor?{
        return listaInstrutores[idFuncionario]
    }

    func consultarAparelho (nomeMaquina: String) -> Aparelho?{
        return listaAparelhos[nomeMaquina]
    }

    func consultarTurma (nome: String) -> TurmaColetiva?{
        return listaTC[nome]
    }
    
    func consultarTreino (nome: String) -> TreinoComPersonal?{
        return listaTP[nome]
    }

    func rotinaAparelhos(data: String){
        aparelhosQuebrados.removeAll()
        for (_, aparelho) in listaAparelhos{
            if !aparelho.realizarManutencao(data: data){
                aparelhosQuebrados.append(aparelho)
            }
        }
    }
}