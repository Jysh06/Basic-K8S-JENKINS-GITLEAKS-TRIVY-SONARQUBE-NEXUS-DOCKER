pipeline {
    agent any

 tools {
     jdk 'jdk17'
     maven 'maven3'
 }
 
 environment {
     SCANNER_HOME = tool 'sonar-scanner'
 }
    
    stages {
        
        stage('GIT CHECKOUT') {
            steps {
                git branch: 'main', url: 'https://github.com/Jysh06/GitLab-CICD-BoardGame-Java.git'
            }
        }
        
        stage('GITLEAKS') {
            steps {
                sh 'gitleaks detect --source . -r gitleaks-report.txt'
            }
        }
        
        stage('COMPILE') {
            steps {
            sh  'mvn compile'
            }
        }
        
        stage('TRIVY FILESCAN') {
            steps {
            sh  'trivy fs --format table -o trivy-fs-report.txt .'
            }
        }
        
        stage('TEST') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('SONARQUBE') {
            steps {
                withSonarQubeEnv('sonar') {
                 sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Boardgame \
                 -Dsonar.projectKey=Boardgame -Dsonar.java.binaries=target '''
                }
            }
        }
        
        stage('QUALITY GATE') {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
                    }
                }
            }
            
        stage('PACKAGE') {
            steps {
                sh 'mvn package'
            }
        }
        
        stage('NEXUS DEPLOYMENT') {
            steps {
               withMaven(globalMavenSettingsConfig: 'gconfig', jdk: 'jdk17', maven: 'maven3', traceability: true) {
                    sh 'mvn deploy'
                }
            }
        }
        
        stage('DOCKER BUILD & TAG') {
            steps {
              script {
                withDockerRegistry(credentialsId: 'DockerHub') {
                    sh 'docker build -t jysh06/boardggame:v1 .'
                }
              }
            }
        }
        
        stage('TRIVY IMAGESCANE') {
            steps {
            sh  'trivy image --format table -o trivy-image-report.txt jysh06/boardggame:v1'
            }
        }
        
        stage('DOCKER PUSH') {
            steps {
              script {
                withDockerRegistry(credentialsId: 'DockerHub') {
                    sh 'docker push jysh06/boardggame:v1'
                }
              }
            }
        }
        
        stage('DEPLOY TO KUBERNETES') {
            steps {
              script {
                  withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8s', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://172.31.3.102:6443') {
                    sh 'kubectl apply -f deployment-service.yaml'
                }
              }
            }
        }
        
        
    }
}
