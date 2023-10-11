pipeline {
  agent any
  environment {
    CLOUDSDK_CORE_PROJECT='devops-399217'
    GCLOUD_CREDS=credentials('googlecloud-creds')
  }


  stages {
    stage('Verify version') {
      steps {
        sh '''
          gcloud version
        '''
      }
    }
    stage('Authenticate') {
      steps {
        sh '''
          gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"
        '''
      }
    }
    
    stage('Install sonarqube') {
      steps {
        sh '''
          gcloud run services replace cloudrun/sonarquebe.yaml --platform='managed' --region='us-central1'
        '''
      }
    }
  }
  
}
