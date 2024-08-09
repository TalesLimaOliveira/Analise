using Plots

# Ploting graphics
function generate_graphics(simple_times, optimized_times, binary_times, sorting_times)
    for i in 1:4
        p = plot(
            title="Quantidade de buscas = $(q_values[i])",
            xlabel="Tamanho do Vetor (n)",
            ylabel="Tempo (ns)",
            xscale=:log10,
            #yscale=:log10,
            legend=:topright,
            xticks=([10^4, 10^5, 10^6, 10^7], ["10^4", "10^5", "10^6", "10^7"])
        )
    
        plot!(
            p,
            n_values,
            simple_times[:, i],
            label="Busca Simples",
            color=:red,
            lw= 2,
        )
    
        total_optimized_times = sorting_times .+ optimized_times[:, i]
        plot!(
            p,
            n_values,
            total_optimized_times,
            label="Busca Otimizada + Ordenação",
            color=:blue,
            lw= 2
        )
    
        total_binary_times = sorting_times .+ binary_times[:, i]
        plot!(
            p,
            n_values,
            total_binary_times,
            label="Busca Binária + Ordenação",
            color=:green,
            lw= 2
        )
    
        # plot!(
        #     p,
        #     n_values,
        #     sorting_times,
        #     label="Ordenação",
        #     color=:yellow,
        #     lw= 2
        # )
    
        display(p)
        savefig(p, "../imgs/q_size/$(img_output)_$(benchmark_count)-Q_$(q_values[i]).png")
    end

    for i in 1:4
        p = plot(
            title="Tamanho do vetor = $(n_values[i])",
            xlabel="Quantidade de busca (q)",
            ylabel="Tempo (ns)",
            xscale=:log10,
            #yscale=:log10,
            legend=:topright,
            xticks=([10^2, 10^3, 10^4, 10^5], ["10^2", "10^3", "10^4", "10^5"])
        )
    
        plot!(
            p,
            q_values,
            simple_times[i, :],
            label="Busca Simples",
            color=:red,
            lw= 2,
        )
    
        total_optimized_times = sorting_times .+ optimized_times[i, :]
        plot!(
            p,
            q_values,
            total_optimized_times,
            label="Busca Otimizada + Ordenação",
            color=:blue,
            lw= 2
        )
    
        total_binary_times = sorting_times .+ binary_times[i, :]
        plot!(
            p,
            q_values,
            total_binary_times,
            label="Busca Binária + Ordenação",
            color=:green,
            lw= 2
        )
    
        # plot!(
        #     p,
        #     n_values,
        #     sorting_times,
        #     label="Ordenação",
        #     color=:yellow,
        #     lw= 2
        # )
    
        display(p)
        savefig(p, "../imgs/n_size/$(img_output)_$(benchmark_count)-N_$(n_values[i]).png")
    end
end