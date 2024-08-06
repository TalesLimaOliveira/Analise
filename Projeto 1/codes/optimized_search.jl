
# Optimized linear search function
function optimized_search(sorted_vector, key)
    for i in 1:length(sorted_vector)
        if key == sorted_vector[i]
            return i  # Returns the index where the key was found
        elseif key < sorted_vector[i]
            return -1  # Returns -1 if the key is not found
        end
    end
    return -1  # Returns -1 if the key is not found
end