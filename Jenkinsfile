pipeline {
  agent any

  stages{
    stage('test1'){
      agent {docker{ image 'openjdk:18-jdk-alpine'}}
       steps{
           sh 'uname -r'
           sh 'pwd'
           sh  'free -m'
           sh 'df'
           sh 'nproc'
           sh 'cat /etc/os-release'
           
       }   
    }
      
  }
}
  
   
  
   
    
   

   

