## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ##This function Function makeCacheMatrix gets a matrix as an input, set the value of the matrix,
  #get the value of the matrix, set the inverse Matrix and get the inverse Matrix. The matrix object
  #can cache its own object. 
  
  #<<- operator is used to assign a value to an object in an environment that is different 
  #from the current environment 
  
  #take the matrix as an input
  makeCacheMatrix <- function(x = matrix()) {
    invMatrix <- NULL
    
    #set the value of the Matrix
    setMatrix <- function(y) {
      x <<- y
      invMatrix <<- NULL
    }
    
    getMatrix <- function() x                              #get the value of the Matrix
    setInverse <- function(inverse) invMatrix <<- inverse  #set the value of the invertible matrix
    getInverse <- function() invMatrix                     #get the value of the invertible matrix
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInverse = setInverse, getInverse = getInverse)
  } 
  }

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  #get the value of the invertible matrix from the makeCacheMatrix function
  invMatrix <- x$getInverse()
  if(!is.null(invMatrix)) {                       #if inverse matrix is not NULL
    message("Getting Cached Invertible Matrix")   #Type message: Getting Cached Invertible Matrix 
    return(invMatrix)                             #return the invertible matrix
  }
  
  #if value of the invertible matrix is NULL then  
  MatrixData <- x$getMatrix()                     #get the original Matrix Data 
  invMatrix <- solve(MatrixData, ...)             #use solve function to inverse the matrix
  x$setInverse(invMatrix)                         #set the invertible matrix 
  return(invMatrix)                               #return the invertible matrix
}
