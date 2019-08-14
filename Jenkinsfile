pipeline{
    agent none
    stages{
        stage("Clone Repository"){
            agent { label 'master' }
            steps{
                git 'https://github.com/MaximilianCamacho/ssi-backend-devops.git'
                echo " Cloned!"
            }
            
        }
        stage("Build"){
            agent{
                docker 'maven:3.6.1-jdk-8-slim'
            }
            steps{
                sh "mvn -q clean package"
            }
        }
        stage("Package"){
            agent { label ' master' }
            steps{
                archiveArtifacts 'target/*jar'
                sh "docker build -t max/ssi-backend:1.1.0 ."
                sh "docker save -o maxssi.tar max/ssi-backend:1.1.0"
                stash name: "stash-artifact", includes: "maxssi.tar"                
            }
        }
        stage("Archive artifact"){
            agent {label 'master'}
            steps{
                archiveArtifacts 'target/*jar'
            }
        }
        stage("Deployment QA"){
            agent { label 'master' }
            steps{
                sh "docker rm maxssicontainer -f || true"
                sh "docker run -d -p 8090:8090 --name maxssicontainer max/ssi-backend:1.1.0"
            }
        }
        
        // stage("Deployment PROD"){
        //     agent{label 'PROD'}
        //     steps{
        //          unstash "stash-artifact"
        //          sh "docker load -i blog.tar"
        //          sh "docker rm blog -f || true"
        //          sh "docker run -d -p 8090:8090 --name blog mauricio/blog"
        //     }
        // }
    }
}