pipeline {

    agent any

    tools {
        go 'go1.12.1'
        dockerTool 'docker'
    }
    environment {
        GO112MODULE = 'on'
        CGO_ENABLED = 0 
        GOPATH = "${WORKSPACE}/go"
    }
    stages{
        stage("build") {
            steps {
                echo 'BUILD EXECUTION STARTED'
                sh 'go version'
                sh 'go build ${GOPATH}/main.go'
                sh 'cp ${WORKSPACE}/main ${WORKSPACE}/go'
            }
        }
        stage("Docker Build"){
            steps{
                sh 'docker build -t helloworldgolang -f ${GOPATH}/Dockerfile .'
            }
    }
            stage ('Docker Push'){
            steps{
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUsername')]) {
      sh 'docker login -u ${dockerUsername} -p ${dockerPassword}'
}
            sh 'docker tag helloworldgolang:latest suryansh1234/inc42_assesment:helloworldgo'
            sh 'docker push  suryansh1234/inc42_assesment:helloworldgo'
          
}
}

    }
}
