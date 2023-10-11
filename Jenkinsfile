pipeline {
  agent any
  environment {
    CLOUDSDK_CORE_PROJECT='devops-399217'
    GCLOUD_CREDS=credentials('googlecloud-creds')
  }


  stages {
    stage('Authenticate') {
      steps {
        sh '''
          gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"
        '''
      }
    }
  }
  
}
