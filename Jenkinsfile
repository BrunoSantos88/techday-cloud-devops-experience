pipeline {
    agent any
    environment {
        PROJECT_ID = 'devops-399217'
        CLUSTER_NAME = 'services-cluster'
        LOCATION = 'us-central1-b'
        CREDENTIALS_ID = 'multi-k8s'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
       
       stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/hello:latest/hello:${env.BUILD_ID}/g' frontend.yml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'frontend.yml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }
}