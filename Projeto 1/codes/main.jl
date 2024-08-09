include("simple_search.jl")
include("optimized_search.jl")
include("binary_search.jl")
include("plots.jl")


# Const
benchmark_count = 1
img_output = "Bench"

# List Sizes
n_values = [10^i for i in 4:7] # Vectors Sizes
q_values = [10^i for i in 2:5] # Amount of Keys

Random.seed!(1234)

# Initialize the list of vectors and keys
key_list = [rand(1:10^3, q) for q in q_values]
vec_list = [rand(1:10^3, n) for n in n_values]


# Initialize the list of timers
simple_times = zeros(length(n_values), length(q_values))
optimized_times = zeros(length(n_values), length(q_values))
binary_times = zeros(length(n_values), length(q_values))
sorting_times = zeros(length(n_values))


# Dummy search function
function dummy_search(search_func, vector, keys)
    [search_func(vector, k) for k in keys]
end

# Benchmark macro
function my_benchmark(search_func, time_matrix)
    for i in 1:length(vec_list) # For each vector size
        for j in 1:length(key_list)  # For each key numbers
            median_time = zeros(benchmark_count)
            for c in 1:benchmark_count
                start = time_ns()
                [search_func(vec_list[i], k) for k in key_list[j]]
                final = time_ns()
                median_time[c] = (final - start) / 1e9
            end
            time_matrix[i, j] = median(median_time)
        end
    end
end


# Measure linear search
my_benchmark(simple_search, simple_times)

# Measure sorting
for i in 1:length(vec_list)
    median_time = zeros(benchmark_count)
    for c in 1:benchmark_count
        start = time_ns()
        sort(vec_list[i], alg=QuickSort)
        final = time_ns()
        median_time[c] = (final - start) / 1e9
    end
    sorting_times[i] = median(median_time)
end

[sort!(sublist) for sublist in vec_list]
vec_list

# Measure optimized search
my_benchmark(optimized_search, optimized_times)

# Measure binary search
my_benchmark(binary_search, binary_times)

generate_graphics(simple_times, optimized_times, binary_times, sorting_times)