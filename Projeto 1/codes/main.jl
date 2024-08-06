include("simple_serch.jl")
include("optimized_serch.jl")
include("binary_serch.jl")
include("check_time.jl")

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

    # Initialize the list of vectors and keys
    vector_list = [generate_vectors(n, upper_limit) for n in n_values]
    key_list = [generate_keys(q, upper_limit) for q in q_values]

    # Initialize the list of timers
    time_simple_search = Matrix{Float64}(undef, length(n_values), length(q_values))
    time_optimized_search = Matrix{Float64}(undef, length(n_values), length(q_values))
    time_binary_search = Matrix{Float64}(undef, length(n_values), length(q_values))
    time_to_sort = Vector{Float64}(undef, length(n_values))

    ##############################################################################

    # Simple linear search - Benchmarking
    for i in 1:length(n_values)  # For each vector size
        for j in 1:length(q_values)  # For each key numbers
            initial_time = time_ns()
            for key in key_list[j]
                simple_search(vector_list[i], key)
            end
            final_time = time_ns()
            time_simple_search[i, j] = (final_time - initial_time) / 1e9
        end
    end


    # Sorting the vectors - Benchmarking
    for i in 1:length(n_values)   # For each vector size
        initial_time = time_ns()
        vector_list[i] = sort(vector_list[i])  # Sort the vectors
        final_time = time_ns()
        time_to_sort[i] = (final_time - initial_time) / 1e9
    end
    

    # Optimized Linear search - Benchmarking
    for i in 1:length(n_values)   # For each vector size
        for j in 1:length(q_values)  # For each key numbers
            initial_time = time_ns()
            for key in key_list[j]
                optimized_search(vector_list[i], key)
            end
            final_time = time_ns()
            time_simple_search[i, j] = (final_time - initial_time) / 1e9
            end
        end
    end


    # Binary search - Benchmarking
    for i in 1:length(n_values)   # For each vector size
        for j in 1:length(q_values)  # For each key numbers
            initial_time = time_ns()
            for key in key_list[j]
                binary_search(vector_list[i], key)
            end
            final_time = time_ns()
            time_simple_search[i, j] = (final_time - initial_time) / 1e9
        end
    end

    return time_simple_search, time_optimized_search, time_binary_search, time_to_sort
end

# Run the benchmark
simple, optimized, binary, sort = benchmark_search()

check_time(simple, optimized, binary, sort)
generate_graphics(simple, optimized, binary, sort)
