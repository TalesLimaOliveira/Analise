using BenchmarkTools

# Function to generate a vector of random values
function generate_random_vector(size::Int, upper_limit::Int)
    return rand(1:upper_limit, size)
end

# Function to generate a random key
function generate_random_key(upper_limit::Int)
    return rand(1:upper_limit)
end

# Binary search function
function binary_search(sorted_vector, key)
    low = 1
    high = length(sorted_vector)
    
    while low <= high
        mid = (low + high) ÷ 2
        if sorted_vector[mid] == key
            return mid  # Returns the index where the key was found
        elseif sorted_vector[mid] < key
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return -1  # Returns -1 if the key is not found
end

# Benchmarking the binary search function
function benchmark_binary_search()
    vector_size = 1000000  # Adjust the size of the vector for benchmarking
    upper_limit = 1000000  # Adjust the upper limit for generating random numbers
    num_tests = 10000

    vector = generate_random_vector(vector_size, upper_limit)
    sorted_vector = sort(vector)

    for _ in 1:num_tests        
        key = generate_random_key(upper_limit)  # Generate a random key within the specified upper limit
        result = @btime binary_search($sorted_vector, $key)
        if result == -1
            println("Key not found.")
        else
            println("Key found at position: ", result)
        end
    end      
end

# Run the benchmark
benchmark_binary_search()
