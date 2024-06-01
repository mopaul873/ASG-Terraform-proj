pipeline {
  agent any
   
   stages{
    stage('test1'){
       agent {docker{ image 'openjdk:18-jdk-alpine'}} 
        steps{
            sh "cat /etc/os-release"
        } 
     }
   }
}
   

