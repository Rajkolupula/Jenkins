pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Rajkolupula/Jenkins.git'
            }
        }
        stage('python apply') {
            steps {
                sh 'python3 app.py'
            }
        }
    }
}
