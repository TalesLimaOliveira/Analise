include("bubble.jl")
include("heap.jl")
include("plots.jl")

using Statistics

benchmark_count = 10
array_size = [10^i for i in 4:8]
array_list = [rand(1:10^2, i) for i in array_size]

bubblesort_time = zeros(length(array_size))
heapsort_time = zeros(length(array_size))

function my_benchmark(dummy_func, dummy_time)
    for i in 1:length(array_list)
        median_time = zeros(benchmark_count)
        for c in 1:benchmark_count
            array_copy = copy(array_list[i])
            start = time_ns()
            dummy_func(array_copy)
            final = time_ns()
            median_time[c] = (final - start) / 1e9
        end
        dummy_time[i] = median(median_time)
    end
end

# Executando os benchmarks
my_benchmark(sqrtsort_bubble, bubblesort_time)
my_benchmark(sqrtsort_heap, heapsort_time)

# Geração do gráfico de comparação
generate_plot(bubblesort_time, heapsort_time, array_size)
