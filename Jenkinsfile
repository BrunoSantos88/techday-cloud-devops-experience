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
      sh ('kubectl patch svc argocd-server -n argocd -p \ '{"spec": {"type": "NodePort", "ports": [{"name": "http", "nodePort": 30080, "port": 80, "protocol": "TCP", "targetPort": 8080}, {"name": "https", "nodePort": 30443, "port": 443, "protocol": "TCP", "targetPort": 8080}]}}'')
      sh ('kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=”{.data.password}” | base64 -d; echo')

		}
	      }
   	}
  }
  
}
