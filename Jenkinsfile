pipeline {
    agent any
    
    environment {

        PATH = "C:\\WINDOWS\\SYSTEM32;C:\\Program Files\\Docker\\Docker\\resources\\bin"
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
                        bat "docker run -d -p 8090:5000 abdullahajaz/classtask_02:latest"
                    }else{
                        error "Docker image build failed."
                    }
                }
            }
        }        
    }
}
