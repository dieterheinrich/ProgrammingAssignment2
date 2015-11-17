## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    matrix_inv <- NULL
    ## define set function to set the values of a martix whos inverse
    ## is calculated
    set <- function(y) {
        x <- y
        matrix_inv <- NULL
    }
    ## define get function to get the state/values of the current matrix
    get <- function() x
    ## define set_matrix_inv function to set the inverse of a matrix
    ## to a given value
    set_matrix_inv <- function(minv) matrix_inv <- minv
    ## define get_matrix_function to get the current state/valuses of
    ## the inverse matrix
    get_matrix_inv <- function() matrix_inv
    ## collect functions defined above in a list
    list(set = set, get = get, 
         set_matrix_inv = set_matrix_inv, 
         get_matrix_inv = get_matrix_inv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## Get the inverse of 'x'
    matrix_inv <- x$get_matrix_inv()
    ## check wether the inverse is defined
    if(!is.null(matrix_inv)) {
        message("getting cached data")
        return(matrix_inv)
    }
    ## If the inverse of x is not defined
    ## get the data and calculate the inverse
    data <- x$get()
    matrix_inv <- solve(data)
    ## Finally set the inverse of 'x' in the cache
    x$set_matrix_inv(matrix_inv)
}
