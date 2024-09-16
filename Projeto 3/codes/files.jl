using Printf

# Função para resolver todos os arquivos e calcular a média do tempo
function analisar_arquivos(diretorio)
    arquivos = glob("$diretorio/*")
    tempos_totais = Dict("Menor Peso" => 0.0, "Benefício/Custo" => 0.0, "Programação Dinâmica" => 0.0)
    num_arquivos = length(arquivos)

    for arquivo in arquivos
        println("Analisando arquivo: $arquivo")
        I, C, P, V = ler_entrada_arquivo(arquivo)
        tempos = medir_tempo(I, C, P, V)

        # Acumula os tempos
        for (abordagem, tempo) in tempos
            tempos_totais[abordagem] += tempo
        end
    end

    # Calcula a média dos tempos
    for abordagem in keys(tempos_totais)
        tempos_totais[abordagem] /= num_arquivos
    end

    return tempos_totais
end

function ler_entrada_arquivo(nome_arquivo)
    open(nome_arquivo, "r") do file
        I, C = parse.(Int, split(readline(file)))
        P = []
        V = []
        for _ in 1:I
            peso, valor = parse.(Int, split(readline(file)))
            push!(P, peso)
            push!(V, valor)
        end
        return I, C, P, V
    end
end

function salvar_saida_arquivo(nome_arquivo, result, max_value)
    open(nome_arquivo, "w") do file
        println(file, join(result, ", "))
        println(file, max_value)
    end
end