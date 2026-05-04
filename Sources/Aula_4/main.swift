extension Academia {
    func exibirMetricas() {
        print("\n=== Métricas e Indicadores da Central ===")
        print("Total de Alunos Matriculados: \(listaAlunos.count)")
        print("Total de Instrutores Ativos: \(listaInstrutores.count)")
        print("Total de Aulas Ativas: \(listaTC.count + listaTP.count)")
        print("Equipamentos Danificados: \(aparelhosQuebrados.count)")
        print("==========================================")
    }
}

// MARK: - Roteiro de Testes

print("=== INICIALIZAÇÃO DA CENTRAL ACADEMIA ===\n")
let central = Academia()

// 1. Instanciando múltiplos perfis
let aluno1 = Aluno(nome: "João Silva", email: "joao@email.com", funcao: "Aluno", matricula: "A001", plano: .mensal, nivel: .iniciante)
let aluno2 = Aluno(nome: "Maria Oliveira", email: "maria@email.com", funcao: "Aluno", matricula: "A002", plano: .trimestral, nivel: .intermediario)
let aluno3 = Aluno(nome: "Pedro Santos", email: "pedro@email.com", funcao: "Aluno", matricula: "A003", plano: .anual, nivel: .avancado)

let instrutor1 = Instrutor(nome: "Carlos Souza", email: "carlos@email.com", funcao: "Instrutor", especialidade: .muscalacao, idFuncionario: "F001")
let instrutor2 = Instrutor(nome: "Ana Costa", email: "ana@email.com", funcao: "Instrutor", especialidade: .yoga, idFuncionario: "F002")

print("--- Teste 1: Adicionando perfis ---")
central.adicionarAluno(aluno: aluno1)
central.adicionarAluno(aluno: aluno2)
central.adicionarAluno(aluno: aluno3)

central.adicionarInstrutor(instrutor: instrutor1)
central.adicionarInstrutor(instrutor: instrutor2)

print("\n--- Teste 2: Rejeição por duplicação de cadastro ---")
central.adicionarAluno(aluno: aluno1)

// 2. Instanciando Aparelhos
let aparelho1 = Aparelho(nomeMaquina: "Esteira Ergométrica 01")
let aparelho2 = Aparelho(nomeMaquina: "Supino Reto")
let aparelho3 = Aparelho(nomeMaquina: "Cadeira Extensora")

central.adicionarAparelho(aparelho: aparelho1)
central.adicionarAparelho(aparelho: aparelho2)
central.adicionarAparelho(aparelho: aparelho3)

// 3. Aulas
let turma1 = TurmaColetiva(nome: "Yoga Coletivo", instrutor: "Ana Costa", categoria: "Yoga", descricao: "Turma de Yoga para todos os níveis")
let treino1 = TreinoComPersonal(nome: "Treino Personal - Pedro", instrutor: "Carlos Souza", categoria: "Musculação", descricao: "Treino de alta intensidade", matriculaAluno: "A003")

central.adicionarTurmaColetiva(tc: turma1)
central.adicionarTreinoComPersonal(tp: treino1)

print("\n--- Teste 3: Rejeição de uso de benefícios incompatíveis (plano Mensal sem Personal) ---")
let treinoIncompativel = TreinoComPersonal(nome: "Treino Personal - João", instrutor: "Carlos Souza", categoria: "Musculação", descricao: "Treino sem plano compatível", matriculaAluno: "A001")
_ = central.adicionarTreinoComPersonal(tp: treinoIncompativel)

print("\n--- Teste 4: Rejeição por superlotação de turma coletiva ---")
print("Tentando realizar 22 inscrições para uma turma com limite de 20 pessoas:")
for i in 1...22 {
    let _ = turma1.fazerInscricao()
}

// 4. Teste de Manutenção de Aparelhos
print("\n--- Teste 5: Manutenção de Equipamentos ---")
print("Simulando que o aparelho 'Esteira Ergométrica 01' foi utilizado e precisa de manutenção:")
_ = aparelho1.realizarManutencao(data: "04/05/2026")

print("\nExecutando o sistema de manutenção global da academia:")
central.rotinaAparelhos(data: "04/05/2026")

// 5. Polimorfismo
print("\n--- Teste 6: Polimorfismo - Coleção Heterogênea de Pessoas (Pessoa) ---")
let colecaoPessoas: [Pessoa] = [aluno1, aluno2, instrutor1, instrutor2]
for p in colecaoPessoas {
    print("Nome: \(p.nome) | Função: \(p.funcao)")
}

print("\n--- Teste 7: Polimorfismo - Coleção Heterogênea de Aulas (Aula) ---")
let colecaoAulas: [Aula] = [turma1, treino1]
for a in colecaoAulas {
    print("Aula: \(a.nome) | Categoria: \(a.categoria) | Instrutor: \(a.instrutor)")
}

// 6. Métricas da academia
central.exibirMetricas()
