pipeline {

    agent {dockerfile true}
    stage{
     steps {
             sh 'python3 -m robot.run  -d Reports Tests'
             sh 'echo myapp = ${myapp}'
            }
     }
     post {
                always {
                    robot(
                        outputPath: 'Reports/',
                        logFileName: 'log.html',
                        reportFileName: 'report.html',
                        otherFiles: '*.log'
                    )
                    emailext body: 'hello', from: 'pinky.kumari@signanthealth.com', replyTo: 'pinky.kumari@signanthealth.com', subject: "${env.JOB_NAME} - Build# ${env.BUILD_NUMBER}", to:  'pinky.kumari@signanthealth.com, pinkykumarihere@gmail.com'

                }
            }
        }
    }
}