pipeline {

    agent any

    tools {
        go 'go1.12.1'
    }
    environment {
        GO112MODULE = 'on'
        CGO_ENABLED = 0 
        GOPATH = "${JENKINS_HOME}/${JOB_NAME}/builds/${BUILD_ID}"
    }
    stage{
        stage("build") {
            steps {
                echo 'BUILD EXECUTION STARTED'
                sh 'go version'
                sh 'go build'
            }
        }

    }
}
