pipeline {

    agent any

    tools {
        go 'go1.12.1'
        docker 'docker'
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
            }
        }
        stage("Docker Build"){
            steps{
                sh 'docker build -t helloworldgolang -f ${GOPATH}/Dockerfile .'
            }
    }

    }
}
