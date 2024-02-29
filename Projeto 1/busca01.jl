using BenchmarkTools

# Function to generate a vector of random values
function generate_random_vector(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end

# Function to generate a random key
function generate_random_key(upper_limit::Int)
    return rand(1:upper_limit)
end

# Sequential search function
function sequential_search(vector, key)
    for i in 1:length(vector)
        if vector[i] == key
            return i  # Returns the index where the key was found
        end
    end
    return -1  # Returns -1 if the key is not found
end

# Benchmarking the sequential search function
function benchmark_sequential_search()
    vector_size = 1000000  # Adjust the size of the vector for benchmarking
    upper_limit = 1000000  # Adjust the upper limit for generating random numbers
    num_tests = 10000
    
    vector = generate_random_vector(vector_size, upper_limit)

    for _ in 1:num_tests        
        key = generate_random_key(upper_limit)  # Generate a random key within the specified upper limit
        result = @btime sequential_search($vector, $key)
        if result == -1
            println("Key not found.")
        else
            println("Key found at position: ", result)
        end
    end
end

# Run the benchmark
benchmark_sequential_search()
