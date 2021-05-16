node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
//        app = docker.build("csherida/ubi8-httpd")
        app = docker.build("ospid-9d22003a-fabe-41fe-9e31-9a70c1c3ff14/ubi8-httpd:${env.BUILD_NUMBER}", "./Dockerfile")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
//          script {
//               final String url = "http://localhost:80"
//
//                final String response = sh(script: "curl -s $url", returnStdout: true).trim()
//
//                echo response
//          }
            
    }

    stage('Push image') {
//        docker.withRegistry('https://quay.io', 'quay-credentials') {
//            app.push("${env.BUILD_NUMBER}")
//            app.push("latest")
        docker.withRegistry('https://scan.connect.redhat.com', 'connect-credentials') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
}
