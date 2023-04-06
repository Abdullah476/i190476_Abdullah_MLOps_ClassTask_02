pipeline {
    agent any
    
    environment {

        PATH = "C:\\WINDOWS\\SYSTEM32;C:\\Program Files\\Docker\\Docker\\resources\\bin;C:\\kube"
    }

    stages {    
        
        stage('Build image, Push to Hub, Run the image') {
            steps {
                script{
                    dockerImage = docker.build("abdullahajaz/classtask_02:latest")
                    if(dockerImage){
                        withDockerRegistry([credentialsId: "dockerhub", url: ""]) {
                            dockerImage.push()
                        }
                        //bat "docker run -d -p 8090:8090 abdullahajaz/classtask_02:latest"
                    }else{
                        error "Docker image build failed."
                    }
                }
            }
        }
        
        stage('Deploy the image from Docker Hub to kubernetes') {
            steps {
                script {
                    // deleting the previous profiles
                    bat "minikube delete --all"
                    // start the minikube
                    bat "minikube start --force-systemd"
                    // create the service and deployment for kubernetes
                    bat "kubectl apply -f kubernetes.yml"
                    // get the list of pods
                    bat "kubectl get pods"
                    // get the service currently running
                    bat "kubectl get svc"
                    // to access the application in your localhost browser
                    // bat "minikube service flask-service"
                }
            }
        }
    }
}
