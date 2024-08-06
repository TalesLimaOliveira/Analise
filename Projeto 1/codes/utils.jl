using Plots

# Ploting graphics
function generate_graphics(time_simple_search, time_optimized_search, time_binary_search, time_to_sort)
    n_values = [10^4, 10^5, 10^6, 10^7]
    q_values = [10^2, 10^3, 10^4, 10^5]

    for j in 1:eachindex(q_values)
        p = plot(
            n_values,
            time_simple_search[:, j],
            label = "Simples",
            xlabel = "Tamanho do Vetor (n)",
            ylabel = "Tempo (s)",
            title = "Numero de Busca (q) = $(q_values[j])",
            legend = :topleft,
            lw = 2  # Line Width
        )
        plot!(n_values, time_optimized_search[:, j], label = "Otimizada", lw = 2)
        plot!(n_values, time_binary_search[:, j], label = "Binária", lw = 2)
        plot!(n_values, time_to_sort, label = "Ordenarção", lw = 2)
    
        display(p)
        # savefig(p, "../imgs/benchmark_q_$(q_values[j]).png")
    end
end