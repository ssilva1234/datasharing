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