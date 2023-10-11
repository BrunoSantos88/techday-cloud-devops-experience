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

    stage('Install sonarqube') {
      steps {
        sh '''
          gcloud run services replace cloudrun/sonarquebe.yaml --platform='managed' --region='us-central1'
        '''
      }
    }
  }
  
}
