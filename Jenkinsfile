pipeline {

    agent any

    stages {

        stage('junit build') {
                steps {
                    sh "mvn compile"
                }
            }
            stage('junit test') {
                steps {
                    sh "mvn test"
                }
            }
            stage('newman') {

                steps {

                    sh 'newman run Restful_Booker_Facit.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'

                }

            post {

                always {

                        junit '**/*xml'

                    }

                }
            }

        stage('robot') {
               steps {
                    sh 'robot -d results --variable BROWSER:headlesschrome car.robot'


               }
        post {
                always {
                    script {
                      step(
                            [
                              $class              : 'RobotPublisher',
                          outputPath          : 'results',
                              outputFileName      : '**/output.xml',
                              reportFileName      : '**/report.html',
                              logFileName         : '**/log.html',
                              disableArchiveOutput: false,
                              passThreshold       : 50,
                              unstableThreshold   : 40,
                              otherFiles          : "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
        }
    }

    
}