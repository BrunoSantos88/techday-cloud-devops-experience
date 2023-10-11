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
          gcloud components install kubectl
          gcloud container clusters get-credentials services-cluster --zone us-central1-b --project devops-399217
        '''
      }
    }

    stage('Cluster GKE') {
      steps {
        sh '''
          kubectl get nodes
        '''
      }
    }
  }
  
}
