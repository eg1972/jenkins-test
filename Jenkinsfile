pipeline {
    agent {
        docker { image 'ubuntu:bionic' }
    }
    environment {
        VAR1 = 'var1'
        VAR2 = 'var2'
    }
    stages {
        stage('Test') {
            steps {
                sh '''
                  echo "Stage: Test"
                  echo "VAR1: ${VAR1}; VAR2: ${VAR2}"
                  uname -a
                  df -ah
                  ls -la
                  ls -la /
                  sleep 10
                  echo "================================================================"
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