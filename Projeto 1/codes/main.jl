include("simple_search.jl")
include("optimized_search.jl")
include("binary_search.jl")
include("utils.jl")


# VARS
n_values = [10^i for i in 4:7]  # Vectors Sizes
q_values = [10^i for i in 2:5]  # Amount of Keys

# Initialize the list of vectors and keys
vector_list = [rand(1:10^5, n) for n in n_values]
key_list = [collect(1:1:q) for q in q_values] # K2[1-100], ... , K5[1-10^5]

# Initialize the list of timers
time_simple = zeros(length(n_values), length(q_values))
time_optimized = zeros(length(n_values), length(q_values))
time_binary = zeros(length(n_values), length(q_values))
time_sort = zeros(length(n_values))



time_simple = simple_benchmark(vector_list, key_list)

# Sorting the vectors - Benchmarking
for i in 1:length(vector_list)   # For each vector size
    bench_sort = @benchmark sort($vector_list[$i])
    time_sort[i] = median(bench_sort).time / 1e9
    vector_list[i] = sort(vector_list[i])
end

time_optimizedh = optimized_benchmark(vector_list, key_list)
time_binary = binary_benchmark(vector_list, key_list)

generate_graphics(time_simple, time_optimized, time_binary, time_sort)
