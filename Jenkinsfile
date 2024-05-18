pipeline {
//   agent { label 'jenkins-agent' }
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
        script {
            docker.withRegistry('https://index.docker.io/v1/', 'jenkins-dockerhub') {
              def previousCommit = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT ?: 'HEAD'
              def currentCommit = env.GIT_COMMIT
              def commitDetails = sh(script: "git log --pretty=format:\"%s - %an (<https://github.com/Hang8186/hang-website/commit/%h|details>)\" ${previousCommit}..${currentCommit} | nl -n ln -w1 -s'. '", returnStdout: true).trim()
              env.commitDetails = commitDetails
              def dockerImage = docker.build('mariahang86/hang-website', '-f Dockerfile .')
              dockerImage.push('latest')
            }
        }
      }
    //   post {
    //     success {
    //       slackSend (channel: "#website", color: 'good', message: "${env.commitDetails}")
    //     }  
    //     failure {
    //       slackSend (channel: "#website", color: 'danger', message: "FAILURE: Docker image build and push failed.")
    //     }
    //   }
    }
    stage('Deploy') {
      steps {
        sshagent(['manager']) {
          sh 'ssh -o StrictHostKeyChecking=no -l hang 192.168.226.145 sudo sh /home/hang/Desktop/hang-website/deploy.sh'
        }
      }
    //   post {
    //     success {
    //       slackSend (channel: "#website", color: 'good', message: "SUCCESS: Website deployed successfully.")
    //     }  
    //     failure {
    //       slackSend (channel: "#website", color: 'danger', message: "FAILURE: Website deployment failed.")
    //     }
    //   }
    }
  }
}
