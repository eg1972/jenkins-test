pipeline {
    agent {
        docker { image 'ubuntu:bionic' }
    }
    environment {
        FILE1 = 'FILE1.sav'
        FILE2 = 'FILE2.sav'
    }
    stages {
        stage('Create Files and Artifacts') {
            steps {
                sh '''
                  echo "Stage: Create files and artifacts"
                '''
                sh '''
                  echo "Creating files..."
                  mkdir -p output
                  touch output/${FILE1}
                  touch output/${FILE2}
                  echo "present working directory: "
                  pwd
                  find . -name ${FILE1}
                  echo "================================================================"
                '''
                sleep 5
                archiveArtifacts(artifacts: 'output/*.sav', excludes: 'output/*.md', allowEmptyArchive: true)
                sh '''
                  echo "Where are my artifacts ??"
                  find ${JENKINS_HOME}/jobs/myPipeline1/.
                '''
            }
        }
        stage('Use Artifacts') {
            steps {
                sh '''
                  echo "How can I use my artifacts ??"
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