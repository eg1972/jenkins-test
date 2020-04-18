ipeline {
    agent {
        docker { image 'ubuntu:bionic' }
    }
    stages {
        stage('Test') {
            steps {
                sh '''
                  echo "Stage: Test"
                  echo "Multiline"
                  uneme -a
                  df -ah
                  ls -la
                  echo "================================================================00"
                '''
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}