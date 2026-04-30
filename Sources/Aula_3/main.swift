import Foundation

class Academia{
    private (set) var listaAlunos: [String: Aluno] = [:]
    private (set) var listaInstrutores: [String: Instrutor] = [:]
    init(){

    }
    func adicionarAluno(aluno: Aluno) -> Bool{
        if (listaAlunos[aluno.matricula] != nil){
            print("Aluno já se encontra na lista.")
            return false
        }

        listaAlunos[aluno.matricula] = aluno
        print("Aluno adicionado a lista.")
        return true
    }

    func adicionarInstrutor(instrutor: Instrutor) -> Bool{
        if (listaInstrutores[instrutor.idFuncionario] != nil){
            print("Instrutor já se encontra na lista.")
            return false
        }

        listaInstrutores[instrutor.idFuncionario] = instrutor
        print("Instrutor adicionado a lista.")
        return true
    }

    func consultarAluno (aluno: Aluno) -> Aluno?{
        return listaAlunos[aluno.matricula]
    }

    func consultarInstrutor (instrutor: Instrutor) -> Instrutor?{
        return listaInstrutores[instrutor.idFuncionario]
    }
}