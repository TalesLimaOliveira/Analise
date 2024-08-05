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
    upper_limit = 1000  # Upper limit for generating random numbers

    # Initializing lists for vectors and keys
    vector_list = Vector{Vector{Int}}(undef, 4)
    key_list = Vector{Vector{Int}}(undef, 4)
    
    time_simple_search = Matrix{Float64}(undef, 4, 4)
    time_to_sort = Matrix{Float64}(undef, 4, 4)
    time_optimized_search = Matrix{Float64}(undef, 4, 4)
    time_binary_search = Matrix{Float64}(undef, 4, 4)

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

    # Simple Linear search
    # Save the time
    for i in 1:4
        for j in 1:4
            times = @benchmark begin
                for key in key_list[j]
                    sequential_search(vector_list[i], key)
                end
            end
            time_simple_search[i, j] = minimum(times).time
        end
    end

    # Sorting the vectors
    # Save the time to sort
    for i in 1:4
        times = @benchmark sort(vector_list[i])
        for j in 1:4
            time_to_sort[i, j] = minimum(times).time
        end
        vector_list[i] = sort(vector_list[i])  # Ordenando os vetores
    end
    
    # Optimized Linear search
    # Save the time
    for i in 1:4
        for j in 1:4
            times = @benchmark begin
                for key in key_list[j]
                    optimized_search(vector_list[i], key)
                end
            end
            time_optimized_search[i, j] = minimum(times).time
        end
    end


    # Binary search
    # Save the time
    for i in 1:4
        for j in 1:4
            times = @benchmark begin
                for key in key_list[j]
                    binary_search(vector_list[i], key)
                end
            end
            time_binary_search[i, j] = minimum(times).time
        end
    end

    return time_simple_search, time_to_sort, time_optimized_search, time_binary_search
end

# Run the benchmark
time_simple_search, time_to_sort, time_optimized_search, time_binary_search = benchmark_search()

check_time()
generate_graphics()
