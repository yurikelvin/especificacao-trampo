sig Servico {
	cliente: one Cliente,
	fornecedor: one Fornecedor,
	especialidadeServico: one Especialidade
}
{ especialidadeServico in fornecedor.especialidade  }

abstract sig Usuario {}

sig Cliente extends Usuario {}
sig Fornecedor extends Usuario {
	especialidade: set Especialidade
} { (#especialidade <= 3) and (#especialidade > 0) }

sig Especialidade {}

fact {
	all e: Especialidade | one e.~especialidade
	all x:Servico | all y:Servico | ((x != y) and (x.fornecedor.especialidade = y.fornecedor.especialidade)) => (x.fornecedor != y.fornecedor)
}

pred show[] {}
run show for 12
