pipeline {
    agent any

    environment {
        GIT_REPOSITORY = 'https://github.com/david-dc-chen/puma-ephemeral-gateway-config'
        BASE_IMAGE_NAME = 'gateway'
        BASE_IMAGE_TAG = '95'
        BASE_IMAGE_REGISTRY_HOSTNAME = 'docker.dev1.apimgcp.com'
        BASE_IMAGE_REGISTRY_REPOSITORY    = 'docker-hosted'
        NEW_IMAGE_NAME = 'gateway'
        NEW_IMAGE_TAG = "v${env.BUILD_ID}"
        INIT_IMAGE_NAME = 'openssl'
        INIT_IMAGE_TAG = "v${env.BUILD_ID}"
        NEW_IMAGE_REGISTRY_HOSTNAME = 'docker.dev1.apimgcp.com'
        NEW_IMAGE_REGISTRY_REPOSITORY    = 'docker-hosted'
    }

    stages {
        stage('Pull from Git') {
            steps {
                git "${env.GIT_REPOSITORY}"
            }
        }
        stage('Gradle Preparation & Build') {
            steps {
                sh '''./gradlew clean
                        ./gradlew build'''

            }
        }
        stage('Build Init Image') {
            steps {
                sh """docker login ${env.NEW_IMAGE_REGISTRY_HOSTNAME} -u ${params.NEW_IMAGE_REGISTRY_USER} --password ${params.NEW_IMAGE_REGISTRY_PASSWORD}
                        docker pull frapsoft/openssl
                        ./gradlew -DimageName=${env.INIT_IMAGE_NAME} -DimageTag=${env.INIT_IMAGE_TAG} buildDockerImage"""
                        docker push ${env.NEW_IMAGE_REGISTRY_HOSTNAME}/repository/${env.NEW_IMAGE_REGISTRY_REPOSITORY}/${env.INIT_IMAGE_NAME}:${env.INIT_IMAGE_TAG}"""
            }
        }
        /*
        stage('Build Image with Docker') {
            steps {
                sh """docker login ${env.BASE_IMAGE_REGISTRY_HOSTNAME} -u ${params.BASE_IMAGE_REGISTRY_USER} --password ${params.BASE_IMAGE_REGISTRY_PASSWORD}
                        docker pull ${env.BASE_IMAGE_REGISTRY_HOSTNAME}/repository/${env.BASE_IMAGE_REGISTRY_REPOSITORY}/${env.BASE_IMAGE_NAME}:${env.BASE_IMAGE_TAG}
                        ./gradlew -DimageName=${env.NEW_IMAGE_NAME} -DimageTag=${env.NEW_IMAGE_TAG} buildDockerImage"""
            }
        }

	   stage('Login Docker, Tag and push docker image to Nexus') {
            steps {
		        sh """docker login ${env.NEW_IMAGE_REGISTRY_HOSTNAME} -u ${params.NEW_IMAGE_REGISTRY_USER} --password ${params.NEW_IMAGE_REGISTRY_PASSWORD}
                     docker tag ${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG} ${env.NEW_IMAGE_REGISTRY_HOSTNAME}/repository/${env.NEW_IMAGE_REGISTRY_REPOSITORY}/${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG}
			         docker push ${env.NEW_IMAGE_REGISTRY_HOSTNAME}/repository/${env.NEW_IMAGE_REGISTRY_REPOSITORY}/${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG}"""
            }
        }
        */

    }
}
