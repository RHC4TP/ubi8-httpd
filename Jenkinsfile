node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("rhc4tp/ubi8-httpd")
    }

    stage('Test image') {
//        app.inside {
//            sh 'echo "Tests passed"'
//        }
          steps {
                script {
                    final String url = "http://localhost:80"

                    final String response = sh(script: "curl -s $url", returnStdout: true).trim()

                    echo response
                }
            }
    }

    stage('Push image') {
        docker.withRegistry('https://quay.io', 'quay-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
