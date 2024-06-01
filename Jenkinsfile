pipeline{
  agent any

  stages {
    stage('test1'){
    agent {docker{ image 'openjdk:18-jdk-alpine'}}
    steps{
        sh 'cat /etc/os-release'
    }
    }
      stage('test2'){
    agent {docker{ image 'httpd'}}
    steps{
        sh 'uname -r'

      stage('create'){
        steps{
          sh 'docker run -d --name web -p 8085:80 nginx'
          sh 'docker ps'
        }
      }
  }
}
