pipeline {
    agent any
    environment {
        Docker_TOKEN = credentials('dockerhub_id')
    }
    stages {
        stage("Git Checkout") {
            steps {
                git url: 'https://github.com/bravoris/spring-petclinic-project-testing.git', branch: 'dev'
            }
        }
        stage("mvn build") {
            steps {
                sh ''' 
                export M2_HOME=/opt/apache-maven-3.9.6
                export PATH=$M2_HOME/bin:$PATH

                mvn clean install -Dtest=!PostgresIntegrationTests
                '''
            } 
        }
        stage("docker build and test"){
            steps {
                sh '''
                docker build -t rishhe/pet-clinic:latest .
                '''
            }
        }
        stage("docker push"){
            steps {
                sh '''
                echo $Docker_TOKEN_PSW | docker login -u $Docker_TOKEN_USR --password-stdin
                docker push rishhe/pet-clinic:latest
                '''
            }
        }
        }
    post {
        always {
            sh "docker logout"
        }
    }
}