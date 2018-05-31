gcloud auth activate-service-account --key-file  {
  "type": "service_account",
  "project_id": "cdp-gcp-203008",
  "private_key_id": "5fc6d6d3f0fe91fb4fdfad8a34ce7a8c3d7d1843",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCoB5ETFbBHSESE\nNG5mYMUmQ/DCH9b6+/J6OCKzHzTXpRvpDiAy3BOJTbPEkYoGhtWDXGOICV4XpESi\n+uMyX7vrp/jqlVgFcD5ynnfPcFr1r2sAKKz1vGdrg4+GjgGdGcpOMc7yPrIjfUhr\n0SJpWuUQAyuuVtUopqcUEZoyZhGe7QdeviFx4Q4wClwua7DLz9hvMb0TbNthkR5x\nhZ0DnAEzsZj7WLGYy6CZkR22SeXYymbj069DRahTcRZMNn3EB2ZRiNAzc5PNQNJl\nFNmsbH6o3KpS5T83gtlcLcHXzqUvnJO3W+/7cYELKwQhmoQpj/bDuuaVmJ5CbdqK\nwmokRr7XAgMBAAECggEARIVtalh2XeNBGZ6eBL7ittOO60L7srcqrx+UOvJ3ZJcu\ntg/uHn9zshLPQ9JL9JRonpx+9DtJtR9mZAYmv2Sd6CBEGDmVvwYCWVB5ME0zsqv5\n2QM9YSqXDBeG4IqpaszZHKEgMNZTY7iT32/V9hu8fJamaf58B4tKaBszg+jut51s\n+Nk7hivu7J9419H65KR+818OEnJrXNy1t2gxgNymIy1ZbFOiTIAUOCM7mvl2VmHo\ny3/cONMDwhZpgsLTo76NFOxcVgeYIWNArLQ5YNbGxaJfVHl9ocZNjacC5nm5wPkS\ntEpxEOpOXJX5DxaBdcSbn/yCvR4Rre4NFSjEs/WRVQKBgQDaeRoW7LzhcQrMnD4w\nwtN5U40y5+lnI8ycdL7ACCUxIoVNWjFT7UdsJUZDYRkHa78MTeo2a+bSFC4PuUu/\nDsaE5xl19R5BBMR4Y3V4ON5NE5RK3Xk41S8GLcb17+OauGgjQ/xe4jI27Le0nbFr\nO2fALo0hkLTrtNBeQ/7QfiSGIwKBgQDE5FEjIQ1Y8UOuZw9muznEMLOqUQ7VS+QV\ncEZdEzzGQBrVCpycKn/1mH3LtWotHPBPnmDTz11ztBulYVkPmJiv1zBuZgJ28sXU\nmhSuxEBJpqDvRIYJC2Ku8xpbTTuLVUETrj+YCjWqNxWFxPb8fO8pmjr3la94fHFe\nr28LR+ddvQKBgQDLtkIqgCJ7AAH22fVvWCsCJXMytWZAgvQGKyG2Q6ISV8L+Zow6\nWrTPVU5YA5DoB4LEAV7T0fcPijuM89V6WFepkyd9gsrsC3r7WpotOLGoIwqSaELh\nSH8pfsPXjRCosyx/PaR0AOybpEyDgMrvVxwd6go08w6P/jCQxUwzsntyCwKBgEkN\nXX1nOgiSG8aNvo0jUl+UolTDFnnVWp8JtVG7XYVBK7N36HuY2TlKhwIaIXbzkcY4\nwTxVaBsR7GAEKoM63wv/D50mhCuWEAi90oa1khTBmlysU/7vFoJK+LB/i2Q7EZY3\nxKiowRiSr42ecvVjdWk+LDrIcv6FTZsQBGdvGk0RAoGAJkTp/EeD116jl+x/Z+3M\nP4cNSwv3/W4+H9hGMkIp+PslO7rZ93CbBtMd+S8tQLVJIHgRTXszJGj71w/vLSyo\nmvl9Bqb8K89A3wms+EqeHxm/FzBlIXAxXJFYiwfSymesPvX1Ws6HtKpHAqAnHj/i\nnamdlNE72qgZBVMytNxsXLM=\n-----END PRIVATE KEY-----\n",
  "client_email": "jenkins@cdp-gcp-203008.iam.gserviceaccount.com",
  "client_id": "102570505841588212435",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://accounts.google.com/o/oauth2/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/jenkins%40cdp-gcp-203008.iam.gserviceaccount.com"
}


export PROJECT=$(gcloud info --format='value(config.project)')
gsutil mb gs://$project_id-jenkins-artifacts

mvn clean install test scalastyle:check sonar:sonar org.jacoco:jacoco-maven-plugin:0.7.9:prepare-agent 
gsutil cp /opt/bitnami/apps/jenkins/jenkins_home/workspace/pipeline-trial/target/exclude-resources-demo-0.0.1-SNAPSHOT.jar gs://$project_id-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER/

gsutil acl get gs://$project_id-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER/exclude-resources-demo-0.0.1-SNAPSHOT.jar
