pipeline {
    agent any

    stages {

        stage('Install') {
            steps {
                echo 'Instalando dependencias...'

                sh 'cd app && npm install'
            }
        }

        stage('Build') {
            steps {
                echo 'Executando build...'

                sh 'cd app && npm run build'
            }
        }

        stage('Test') {
            steps {
                echo 'Executando testes...'

                sh 'cd app && npm test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Enviando aplicacao para a VM de producao...'

                sshagent(['app']) {

                sh '''
                    scp -r app/* vagrant@192.168.56.20:/home/vagrant/app-prod/
                '''
                  }
             }
        }
    }

    post {

        success {
            echo 'Pipeline executada com sucesso!'
        }

        failure {
            echo 'A pipeline apresentou erro.'
        }
    }
}