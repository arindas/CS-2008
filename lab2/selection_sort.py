def sort(A, start, end, compF):
    """
    selection_sort: sort the subarrray start...end in A
    according to the given comparator function
    """
    for i in range(end, start, -1):
        indexL = 0
        for j in range(start, i+1):
            if compF(A[j], A[indexL]) > 0:
                indexL = i

        A[i], A[indexL] = A[indexL], A[i]


