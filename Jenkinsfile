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
			steps {
                // Optionally use a Maven environment you've configured already
                withMaven(maven:'Maven 3.5') {
                    sh 'mvn clean package sonar:sonar'
                }
            }
		}
		// No need to occupy a node
		stage("Quality Gate"){
		steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    // Requires SonarQube Scanner for Jenkins 2.7+
                    waitForQualityGate abortPipeline: true
                }
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