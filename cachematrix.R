# EXAMPLE OF INVERTIBLE MATRIX:  matrix(rnorm(16), 4) This is an invertible matrix, use solve(......) to invert.

# theMatrix <- matrix(rnorm(16), 4)
# solve(theMatrix) Returns the inverse
# Use makeCacheMatrix to store and get the matrix inverse.

# makeCacheMatrix will cache the inverse of a matrix
# and store it for later use.
makeCacheMatrix <- function(x = matrix()) {
  b <- NULL
  get <- function() x
  setMatrixInverse <- function(inverse) b <<- inverse
  getMatrixInverse <- function() b
  list(setMatrixInverse = setMatrixInverse, 
       getMatrixInverse = getMatrixInverse)
}
 

# cacheSolve computes the inverse of the special matrix if it
# is not already cached. If it's cached it will retrieve
# the inverse from getMatrixInverse()

cacheSolve <- function(x, ...) {
  b <- x$getMatrixInverse()
  if (!is.null(b)) {
    message("Cached data.")
    return(b)
  }
  data <- x$get()
  b <- solve(data)
  x$setMatrixInverse(b)
  b
}
