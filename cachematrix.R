## PeerAssignment 2 asks us to write a pair of functions that cache the
## inverse of a matrix.  If the inverse has been calculated then, we 
## should be able to pull the computed value.  If the inverse has not be 
## calculated, the computations ought to be performed. 

## PeerAssignment 2 is an exercise in using Github to fork a repo, 
## modify a file and push it back to GitHub.  We are also practicing 
## proper annotation of our code. 

## Function 1, makeCacheMatrix, creates a list of functions that set the
## value of the matrix and prepare to get the inverse.


makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function (y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function () i
        list (set = set, get = get, 
              setinverse = setinverse,
              getinverse = getinverse)
}

## cacheSolve ought to compute the inverse of the matrix returned by
## makeCacheMatrix if the inverse has not already been calculated. If
## the inverse has already been calcuated, the value should be returned.

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        
        ## If inverse is calculated, return it.
        if (!is.null(i)) {
                message("getting cached inverse matrix, i hope")
                return(i)
                
        ## If not, compute it.        
        } else {
        data <- x$get()
        i <- solve(data, ...)
        
        ##Cache
        x$sestinverse(i)
        
        ##Return
        i
        }
}
