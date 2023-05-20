pipeline {
  agent any
  environment { 
    AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    AWS_DEFAULT_REGION = 'ap-southeast-2'
    ECR_REGISTRY = '758153622334.dkr.ecr.ap-southeast-2.amazonaws.com'
  }
  stages {
    stage('Build & Tag') {
      steps {
        sh 'docker build -t my-image .'
      }
    }
    stage('Push') {
      agent {
        docker {
          alwaysPull true
          image 'amazon/aws-cli:latest'
          args '-u root:root'
        }
      }
      steps {
        //withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'jenkins-aws-credential', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
          sh '''
            aws s3 ls
          '''
        //}
        
      }
    }
  }
}