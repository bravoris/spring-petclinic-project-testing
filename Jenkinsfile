pipeline {
    agent any

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

                mvn clean install
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
    }
}
