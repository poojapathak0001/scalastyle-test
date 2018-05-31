gcloud auth activate-service-account --key-file . ./cdp-gcp-203008-5fc6d6d3f0fe.json

export PROJECT=$(gcloud info --format='value(config.project)')
gsutil mb gs://$project_id-jenkins-artifacts

mvn clean install test scalastyle:check sonar:sonar org.jacoco:jacoco-maven-plugin:0.7.9:prepare-agent 
gsutil cp /opt/bitnami/apps/jenkins/jenkins_home/workspace/pipeline-trial/target/exclude-resources-demo-0.0.1-SNAPSHOT.jar gs://$project_id-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER/

gsutil acl get gs://$project_id-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER/exclude-resources-demo-0.0.1-SNAPSHOT.jar
