pipeline {
  agent any

environment {
        PROJECT_ID = 'devops-399217'
        CLUSTER_NAME = 'services-cluster'
        LOCATION = 'us-central1-b	'
        CREDENTIALS_ID =('googlecloud-creds')
    }

  stages {
    stage('Authenticate') {
      steps {
        sh '''
          gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"
        '''
      }
    }
    
    stage('Deploy to GKE') {
            steps{
                step(
                    withKubeConfig([credentialsId: env.CREDENTIALS_ID,
                    clusterName: env.CLUSTER_NAME
                    ]) {
                   sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
                   sh 'chmod u+x ./kubectl'  
                   sh 'kubectl create namespace argocd'
                  }
                )
            }
     }
  }
  
}
