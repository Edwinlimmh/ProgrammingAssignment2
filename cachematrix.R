## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  ## set: changes the matrix stored in the main function
  get <- function () x
  ## get: return the matrix x stored in the main function
  set_inv <- function(inverse) inv <<- inverse
  get_inv <- function() inv
  ## set_inv, get_inv: store the value of the results
  list(set = set, get = get, set_inv = set_inv, get_inv = get_inv)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$get_inv()
  ## getting the data from makeCacheMatrix
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  ## check whether get_inv stored the solve(x), if no,
  ## it will execute the following code:
  data <- x$get()
  inv <- solve(data)
  x$set_inv(inv)
  return (inv)
  ## Return a matrix that is the inverse of 'x'
}
