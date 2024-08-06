using Plots
using Statistics
using Random

# Function to generate a vector of random values
function generate_vectors(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end


# Function to generate a random keys
function generate_keys(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end


#Dummy function to measure time and execute search function
function dummy_search(search_function, vector, keys)
    initial_time = time_ns()
    for key in keys
        search_function(vector, keys)
    end
    final_time = time_ns()
    return (final_time - initial_time) / 1e9
end


# Function to verify time results
function check_time(time_simple_search, time_optimized_search, time_binary_search, time_to_sort)
    println("Tempos de Pesquisa Simples: ", time_simple_search)
    println("Tempo para Ordenar: ", time_to_sort)
    println("Tempos de Pesquisa Otimizada: ", time_optimized_search)
    println("Tempos de Pesquisa Binária: ", time_binary_search)
end

# Ploting graphics
function generate_graphics(time_simple_search, time_optimized_search, time_binary_search, time_to_sort)
    n_values = [10^4, 10^5, 10^6, 10^7]
    q_values = [10^2, 10^3, 10^4, 10^5]

    for j in 1:length(q_values)
        p = plot(
            n_values,
            time_simple_search[:, j],
            label = "Simples",
            xlabel = "Tamanho do Vetor (n)",
            ylabel = "Tempo (s)",
            title = "Numero de Buscas = $(q_values[j])",
            legend = :topleft,
            lw = 2  # Line Width
        )
        plot!(n_values, time_optimized_search[:, j], label = "Otimizada", lw = 2)
        plot!(n_values, time_binary_search[:, j], label = "Binária", lw = 2)
        plot!(n_values, time_to_sort, label = "Ordenação", lw = 2)
    
        display(p)
        savefig(p, "../imgs/benchmark_q_$(q_values[j]).png")
    end
end