pipeline {
    agent any

    stages {
        stage("Git Checkout") {
            steps {
                git url: 'https://github.com/bravoris/spring-petclinic-project-testing.git', branch: 'dev'
            }
        }
        stage("mvn build"){
            steps {
                sh "mvn clean install"
            }
        }
    }
}