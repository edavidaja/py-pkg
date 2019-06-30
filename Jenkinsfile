pipeline {
    stages {
        stage('prep') {
            steps {
                sh 'make prep'
            }
        }
        stage('build') {
            steps {
                sh 'make build'
            }
        }
        stage('package') {
            steps {
                sh 'make run ${BUILD_NUMBER}'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'python*.deb', fingerprint: true
        }
    }
}
