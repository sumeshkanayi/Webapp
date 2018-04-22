pipeline{
  
  agent{
   label "master" 
    
  }
  
  stages{
    stage("maven build and deploy"){
      steps{
        
       sh(script:'mvn install -f trucks/pom.xml')
   
    
        
      }
      
      
      
      
      
      
      
    }
    
    
    
    stage("Build docker image tag and push"){
    
    steps{
    sh "docker login -u sumeshkanayi -p Sia123"
    sh "docker build --tag tomcat ."
    sh "docker tag tomcat sumeshkanayi/webapp:${BUILD_NUMBER}"
    sh "docker push sumeshkanayi/webapp:${BUILD_NUMBER}"
    
    }
    
    }
    
    
    
    stage('kubernetes start deployment'){
    steps{
    sh (script: 'sed -i.bkp "s/IMAGE_TAG/${BUILD_NUMBER}/g" kubernetes/deployment.yaml')
    sh "kubectl apply -f kubernetes/deployment.yaml"
    
    
    }
    
    }
    
     stage('kubernetes deploy service'){
    steps{
    sh "kubectl apply -f kubernetes/service.yaml"
    
    
    }
    
    }

    
    
   
    
    
    
    
    
    
    
    }
  
  
  
  
  
  
}
