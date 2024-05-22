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
                sh 'cp ${WORKSPACE}/main ${GOPATH}'
            }
        }
      stage ('SonarScan'){
          environment{
            scannerHome = tool 'SonarScanner5.0'
              sonarToken = credentials('sonar-token')
              JAVA_HOME = '/usr/lib/jvm/jdk-22.0.1'
            }
        steps{
            
          withSonarQubeEnv('sonarqube'){
              sh ' java -version'
              sh 'echo $JAVA_HOME'
              sh '${scannerHome}/bin/sonar-scanner -Dsonar.host.url=192.168.1.5:8080  -Dsonar.login=${sonarToken} -Dsonar.projectKey=inc42-assesment -Dsonar.projectName=inc42-assesment -Dsonar.sources=${WORKSPACE}/go/ -X'
          }
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
