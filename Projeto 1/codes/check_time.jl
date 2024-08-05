using Plots
using Statistics

# Function to verify time results
function check_time()
    println("Tempos de Pesquisa Simples: ", time_simple_search)
    println("Tempo para Ordenar: ", time_to_sort)
    println("Tempos de Pesquisa Otimizada: ", time_optimized_search)
    println("Tempos de Pesquisa Binária: ", time_binary_search)
end

# Ploting graphics
function generate_graphics()
    n_values = [10^4, 10^5, 10^6, 10^7]
    q_values = [10^2, 10^3, 10^4, 10^5]

    for j in 1:4
        p = plot(
            n_values,
            time_simple_search[:, j],
            label = "Pesquisa Linear Simples",
            xlabel = "Tamanho do Vetor (n)",
            ylabel = "Tempo (s)",
            title = "q = $q_values[j]",
            legend = :topleft
        )
        plot!(n_values, time_to_sort[:, j], label = "Tempo para Ordenar")
        plot!(n_values, time_optimized_search[:, j], label = "Pesquisa Linear Otimizada")
        plot!(n_values, time_binary_search[:, j], label = "Pesquisa Binária")
        
        display(p)
        #savefig(p, "benchmark_q_$q_values[j].png")
    end
end