#The following two functions are used to cache the inverse of a matrix.
# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix<-function(x){
  x<-as.matrix(x)
  i<-NULL
  set<-function(y){
    x<<-y  
    i<<-NULL}
  get<- function() x
  setinv<- function(solve) i<<-solve
  getinv<- function() i
  list(set = set, get = get, setinv = setinv, getinv = getinv)
  
}

#The following function calculates the inverse of the matrix created with the above function
#First, it checks to see if the inverse of the matrix has already been calculated. 
#If so, it gets the inverse of the matrix  from the cache and skips the computation. 
#Otherwise, it calculates the inverse of the matrix of the data and sets the value of the 
#inverse matrix in the cache via the setinv function.

cacheSolve<-function(x, ...){
  i<-x$getinv()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data<-x$get()
  i<-solve(data, ...)
  x$setinv(i)
  i
}
