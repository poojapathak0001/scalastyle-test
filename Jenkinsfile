pipeline {
	agent any
	
	parameters {
        string(name: 'Greeting', defaultValue: 'Hello', description: 'How should I greet the world?')
    }
	
	tools {
		maven 'Maven'
		jdk 'java8'
	}
	
	stages {
		stage ('Initialize') {
			steps {
				
				sh 'chmod 777 script.sh'
				sh 'yes | ./script.sh'
				
			}
		}
		stage('SonarQube analysis') {
			withSonarQubeEnv('My SonarQube Server') {
			// requires SonarQube Scanner for Maven 3.2+
			sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar'
			}
		}
		// No need to occupy a node
		stage("Quality Gate"){
		timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
			def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
			if (qg.status != 'OK') {
			error "Pipeline aborted due to quality gate failure: ${qg.status}"
			}
		}
		stage ('Build') {
			steps {
				
				echo "${params.Greeting} user"
			}
			
			post {
				success {
					echo 'Build Successful'
				}
			}
		}
	}
}
}