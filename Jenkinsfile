//  Christopher Neal's Project1 Pipeline File 

pipeline {
   
   environment {
      imagename = 'chrisneal11/project2'
      registry = 'chrisneal11/projecti2'
      registryCredential = 'dockerhub'
      dockerImage = ''
  } 

   agent any


   stages {
//  Clone the Git Repository
       stage('Cloning_Git') {
          steps{
             checkout scm
          }
       }
// Build the software from the Git repository
        stage('Build_SW') {
           steps {
              sh 'mvn -B -DskipTests clean package'
           }
        }
// Build the Docker Image
        stage('Building_Image') {
            steps {
               script {
                   dockerImage = docker.build registry + ":$BUILD_NUMBER"
//                   dockerImage = docker.build imagename
               }  
            }
        }
// Deploy the Docker Image
        stage('Deploy_Image') {
          steps {
             script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push("$BUILD_NUMBER")
                }
             }  
          }
        }
// Cleanup unused Docker Images
        stage('Remove_unused_Docker_Images') {
            steps {
                sh "docker rmi $imagename:$BUILD_NUMBER"
            }
        }
// Run the new Docker container
        stage('Deploy the Docker Container') {
            steps {
                sh "docker-compose up -d"
            }
        }
   }
}
