include("simple_serch.jl")
include("optimized_serch.jl")
include("binary_serch.jl")
include("check_time.jl")

using BenchmarkTools
using Plots
using Statistics

# Function to generate a vector of random values
function generate_vectors(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end

# Function to generate a random key
function generate_keys(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end


# Benchmarking the functions
function benchmark_search()

    # VARS
    upper_limit = 1000 # Upper limit for generating random numbers
    n_values = [10^4, 10^5, 10^6, 10^7]  # Vectors Sizes
    q_values = [10^2, 10^3, 10^4, 10^5]  # Amount of Keys

    # Inicializar vetores e chaves
    vector_list = [generate_vectors(n, upper_limit) for n in n_values]
    key_list = [generate_keys(q, upper_limit) for q in q_values]


    # TODO: CHECK THE LOGIC BEHIND THIS...
    time_simple_search = [Matrix{Float64}(undef, length(n_values), length(q_values))]
    time_optimized_search = [Matrix{Float64}(undef, length(n_values), length(q_values))]
    time_binary_search = [Matrix{Float64}(undef, length(n_values), length(q_values))]
    time_to_sort = [Vector{Float64}(undef, length(n_values))]


    # Creating 4 vectors:
    #   v[10^4] v[10^5] v[10^6] v[10^7]
    for n in 4:7 
        vector_list[n-3] = generate_vectors(10^n, upper_limit)
    end

    # Creating 4 key_lists:
    #   k[10^2] k[10^3] k[10^4] k[10^5]
    for q in 2:5
        key_list[q-1] = generate_keys(10^q, upper_limit)
    end

##############################################################################

    # Simple linear search - Benchmarking
    for i in 1:length(n_values)  # For each vector size
        for j in 1:length(q_values)  # For each key numbers
            times = @benchmark begin
                for key in key_list[j]
                    sequential_search(vector_list[i], key)
                end
            time_simple_search[i, j] = minimum(times).time / 1e9
        end
    end


    # Sorting the vectors - Benchmarking
    for i in 1:length(n_values)   # For each vector size
        times = @benchmark sort(vector_list[i]) # Do the benchmark sort
        time_to_sort[i] = minimum(times).time / 1e9
        vector_list[i] = sort(vector_list[i])  # Sort the vectors
    end
    

    # Optimized Linear search - Benchmarking
    for i in 1:length(n_values)   # For each vector size
        for j in 1:length(q_values)  # For each key numbers
            times = @benchmark begin
                for key in key_list[j]
                    optimized_search(vector_list[i], key)
                end
            time_optimized_search[i, j] = minimum(times).time / 1e9
        end
    end


    # Binary search - Benchmarking
    for i in 1:length(n_values)   # For each vector size
        for j in 1:length(q_values)  # For each key numbers
            times = @benchmark begin
                for key in key_list[j]
                    binary_search(vector_list[i], key)
                end
            time_binary_search[i, j] = minimum(times).time / 1e9
        end
    end

    return time_simple_search, time_optimized_search, time_binary_search, time_to_sort
end

# Run the benchmark
simple, optimized, binary, sort = benchmark_search()

check_time(simple, optimized, binary, sort)
generate_graphics(simple, optimized, binary, sort)
