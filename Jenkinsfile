pipeline {
    agent any
    environment {
       GCLOUD_CREDS=credentials('googlecloudkey')
       PROJECT_ID = 'devops-399217'

    }

    stages {

     stage('Kubernetes Deployment of ASG Bugg Web Application') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh('kubectl delete all --all -n devsecops')
		  sh ('kubectl apply -f frontend.yml --namespace=devsecops')
		}
	      }
   	}
    }
}
