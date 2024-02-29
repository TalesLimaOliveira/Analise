using BenchmarkTools

# Function to generate a vector of random values
function generate_random_vector(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end

# Function to generate a random key
function generate_random_key(upper_limit::Int)
    return rand(1:upper_limit)
end

# Optimized sequential search function
function optimized_sequential_search(sorted_vector, key)
    for i in 1:length(sorted_vector)
        if key == sorted_vector[i]
            return i  # Returns the index where the key was found
        elseif key < sorted_vector[i]
            return -1  # Returns -1 if the key is not found
        end
    end
    return -1  # Returns -1 if the key is not found
end

# Benchmarking the optimized sequential search function
function benchmark_optimized_sequential_search()
    vector_size = 1000000  # Adjust the size of the vector for benchmarking
    upper_limit = 1000000  # Adjust the upper limit for generating random numbers
    num_tests = 10000

    vector = generate_random_vector(vector_size, upper_limit)
    sorted_vector = sort(vector)

    for _ in 1:num_tests        
        key = generate_random_key(upper_limit)  # Generate a random key within the specified upper limit
        result = @btime optimized_sequential_search($sorted_vector, $key)
        if result == -1
            println("Key not found.")
        else
            println("Key found at position: ", result)
        end
    end   
end

# Run the benchmark
benchmark_optimized_sequential_search()
