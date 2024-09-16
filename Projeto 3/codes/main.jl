using Glob

include("best_value.jl")
include("dinamic_prog.jl")
include("files.jl")
include("lower_weight.jl")
include("plots.jl")

function medir_tempo(I, C, P, V)
    tempos = Dict{String, Float64}()

    # Medir tempo do Programa 1: Menor Peso
    start = time_ns()
    result1, valor_total1 = mochila_menor_peso(I, C, P, V)
    tempo_1 = (time_ns() - start) / 1e9
    tempos["Menor Peso"] = tempo_1

    # Medir tempo do Programa 2: Benefício/Custo
    start = time_ns()
    result2, valor_total2 = mochila_beneficio_custo(I, C, P, V)
    tempo_2 = (time_ns() - start) / 1e9
    tempos["Benefício/Custo"] = tempo_2

    # Medir tempo do Programa 3: Programação Dinâmica
    start = time_ns()
    result3, valor_total3 = mochila_programacao_dinamica(I, C, P, V)
    tempo_3 = (time_ns() - start) / 1e9
    tempos["Programação Dinâmica"] = tempo_3

    return tempos
end


function main()
    file = "large_scale/knapPI_1_100_1000_1"
    tempos = medir_tempo("../test_cases/$file")
    gerar_grafico(tempos)
end

main()