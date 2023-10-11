pipeline {
  agent any
  environment {
    CLOUDSDK_CORE_PROJECT=('PROJECT_ID')
    GCLOUD_CREDS=credentials('googlecloud-creds')
  }


  stages {

    stage('GIT CLONE') {
    steps {
                  // Get code from a GitHub repository1
      git url: 'https://github.com/BrunoSantos88/techday-cloud-devops-experience.git', branch: 'master'

    }
    }
    
        stage('Build and Push Docker Image') {
            steps {
                script {
                   sh'''
                   docker build -t sonarquebe:latest docker-Projetos/sonarquebe/.
                   docker tag sonarquebe:latest us-central1-docker.pkg.dev/devops-399217/sonarquebe:latest
                   docker push us-central1-docker.pkg.dev/devops-399217/sonarquebe:latest
                   '''
                    }
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
