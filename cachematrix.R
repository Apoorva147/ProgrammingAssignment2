## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function acts as getter and setter method for inverse matrix
## make uses of <<- scope operator to set value to diff environments which behaves
## like global variable assignment. exits then updates else creates new one
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinversematrix <- function(inversematrix) i <<- inversematrix
  getinversematrix <- function() i
  list(set = set, get = get,
       setinversematrix = setinversematrix,
       getinversematrix = getinversematrix)
}


## Write a short comment describing this function
## Solve function returns the inverse of matrix
## first time it will cache it, for next time call it will get from cache
##with message "getting cached data"
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
    i <- x$getinversematrix()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinversematrix(i)
    i
}

