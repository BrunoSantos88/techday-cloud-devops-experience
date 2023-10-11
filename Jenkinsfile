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
    
    stage('Argocd Deployment') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh('kubectl create namespace argocd')
		  sh ('kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml')
      sh ('kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=”{.data.password}” | base64 -d; echo')

		}
	      }
   	}
  }
  
}
