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


pipeline {
    agent any
    environment {
       PROJECT_ID = 'devops-399217'
        CLUSTER_NAME = 'services-cluster'
        LOCATION = 'us-central1-b'
    }
    stages {
        stage('Autenticação no Google Cloud') {
            steps {
                script {
                    // Autenticação usando o token de serviço
                    withCredentials([string(credentialsId: 'multi-k8s', variable: 'GCLOUD_KEY')]) {
                        sh "echo '$GCLOUD_KEY' | base64 --decode > /tmp/key.json"
                        withEnv(['CLOUDSDK_CORE_PROJECT=$PROJECT_ID']) {
                            sh "gcloud auth activate-service-account --key-file=/tmp/key.json"
                        }
                    }
                }
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
