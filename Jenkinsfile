pipeline{
    agent any

    parameters {
        string(name: 'IMAGE_TAG', description: 'ENTER THE IMAGE TAG!')
    }


    stages {

        stage('Cleanup Workspace'){
            steps{
                script{
                    cleanWs()
                }
            }
        }

        stage("Checkout git repo"){
            steps{
                git branch: 'master', url: "https://github.com/sabirsaheel0/config-capstone.git"
            }
        }

        stage('Update backend image tag'){
            steps {
                sh "sed -i 's/backend-capstone:.*/backend-capstone:${IMAGE_TAG}/g' manifest/backend-deployment.yaml"
                sh "sed -i 's/frontend-capstone:.*/frontend-capstone:${IMAGE_TAG}/g' manifest/frontend-deployment.yaml"
            }
        }
        stage('Push to github'){
            steps {
                sh 'git config --global user.email sabirsaheel17@gmail.com'
                sh 'git config --global user.name sabirsaheel0'

                sh 'git checkout master'

                sh 'git add manifest/backend-deployment.yaml manifest/frontend-deployment.yaml'

                sh "git commit -m 'Updated image tags to ${IMAGE_TAG}' || echo 'No changes to commit'"

                withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'passwd', usernameVariable: 'username')]) {
                    sh "git push https://${username}:${passwd}@github.com/sabirsaheel0/config-capstone.git master"
                }
            }
        }
        
    }

}