include("bubble.jl")
include("heap.jl")
include("plots.jl")
include("utils.jl")

# Inicializando Lista de vetores e tempos
array_size = [10^i for i in 4:8]
array_list = [rand(1:10^3, i) for i in array_size]
bubblesort_time = zeros(length(array_size))
heapsort_time = zeros(length(array_size))

# Executando os benchmarks
benchmark_count = 10

print("Bubble: ")
start = time_ns()
my_benchmark(sqrtsort_bubble, bubblesort_time)
print((time_ns() - start) / 1e9)

print("\nHeap: ")
start2 = time_ns()
my_benchmark(sqrtsort_heap, heapsort_time)
print((time_ns() - start2) / 1e9)

# Geração do gráfico de comparação
generate_plot(bubblesort_time, heapsort_time, array_size)

println("\nTotal: ", (time_ns() - start) / 1e9)