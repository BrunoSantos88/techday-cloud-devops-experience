pipeline {
    agent any
    environment {
        GCLOUD_CREDS=credentials('gke')
       PROJECT_ID = 'devops-399217'
        CLUSTER_NAME = 'services-cluster'
        LOCATION = 'us-central1-b'
    }

    stages {
         stage('Authenticate') {
      steps {
        sh '''
          gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"
        '''
      }
    }
        stage('Configurar kubectl') {
            steps {
                script {
                    // Configurar o kubectl para acessar o cluster
                    sh "gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE"
                }
            }
        }
        stage('Implantar no GKE') {
            steps {
                script {
                    // Aplicar os recursos do Kubernetes (YAML) para implantar no GKE
                    sh "kubectl apply -f frontend.yml"
                }
            }
        }
    }
}
