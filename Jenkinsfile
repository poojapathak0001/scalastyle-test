pipeline {
	agent any
	
	
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
	}
}