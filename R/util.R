'# 유저의 라이브러리와 시스템 라이브러리 내의 패키지가
'# 중복될 때
pkg.rm.dup <- function(){
    remove.packages(installed.packages() [duplicated(rownames(installed.packages())), 1], lib=.libPaths()[.libPaths() != .Library])
}
pkg.install <- function(pkg = NULL){
  if( class( pkg ) != "character" ){ return( FALSE ) }
  if( length(pkg) <= 0 ){ return( FALSE ) }
  else if( length( pkg ) == 1 ){ if( !require( pkg ) ){ install.packages( pkg ) } }
  else if( length( pkg ) > 1 ){
    for(i in 1:length( pkg )){
      if( !require( pkg[i] ) ){ install.packages( pkg[i] ) }
    }
  }
}
