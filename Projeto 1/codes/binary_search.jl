
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