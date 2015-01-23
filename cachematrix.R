## Function to create and cache inversed matrix

## Function to store the list of logical functions to cache and inverse matrix

makeCacheMatrix <- function(x = matrix()) {
## Initially clear the cache
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  ##Function to get initial matrix
  get <- function() x
  
  ##function to cache inversed matrix
  setinverse <- function(solve) {
    m <<- solve
  }
  ##function to return inversed matrix
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## Function to return cached inversed matrix, or inverse matrix and cache it 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  ##Checks if matrix was already cached, and return it with info message 
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ## assign initial matrix to data, then inverse it with solve, cache it and return
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
